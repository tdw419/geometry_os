; DESCRIPTION: Composite: Places a orange circle of radius 35 at center (424, 163) then Creates a blue rectangular region at (52, 158) spanning 25 by 16 pixels.
; PLAN: r0=424(x), r1=163(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=158(y), r7=25(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 163
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 158
LDI r7, 25
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
