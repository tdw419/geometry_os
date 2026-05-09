; DESCRIPTION: Composite: Creates a blue circular shape at (170, 60) with radius 34 then Renders a black line between points (128, 96) and (310, 216).
; PLAN: r0=170(x), r1=60(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x1), r6=96(y1), r7=310(x2), r8=216(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 60
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 96
LDI r7, 310
LDI r8, 216
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
