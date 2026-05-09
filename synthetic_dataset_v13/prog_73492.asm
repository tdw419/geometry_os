; DESCRIPTION: Composite: Draws a cyan circle centered at (362, 148) with radius 62 then Creates a yellow rectangular region at (129, 112) spanning 30 by 39 pixels.
; PLAN: r0=362(x), r1=148(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=112(y), r7=30(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 148
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 112
LDI r7, 30
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
