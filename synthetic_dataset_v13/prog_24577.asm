; DESCRIPTION: Composite: Places a cyan circle of radius 21 at center (355, 76) then Draws a yellow rectangle at (211, 31) with width 113 and height 72.
; PLAN: r0=355(x), r1=76(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=31(y), r7=113(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 76
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 31
LDI r7, 113
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
