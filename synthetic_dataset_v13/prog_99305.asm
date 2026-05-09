; DESCRIPTION: Composite: Renders a white box of size 34x71 starting at (231, 105) then Creates a blue circular shape at (416, 201) with radius 51.
; PLAN: r0=231(x), r1=105(y), r2=34(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=201(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 105
LDI r2, 34
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 201
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
