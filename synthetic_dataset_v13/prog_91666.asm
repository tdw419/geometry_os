; DESCRIPTION: Composite: Draws a cyan circle centered at (117, 160) with radius 58 then Creates a yellow rectangular region at (219, 90) spanning 98 by 49 pixels.
; PLAN: r0=117(x), r1=160(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=90(y), r7=98(width), r8=49(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 160
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 90
LDI r7, 98
LDI r8, 49
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
