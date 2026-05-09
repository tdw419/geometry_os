; DESCRIPTION: Composite: Renders a yellow line between points (402, 27) and (157, 96) then Renders a blue disk with center (439, 102) and radius 70.
; PLAN: r0=402(x1), r1=27(y1), r2=157(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=102(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 27
LDI r2, 157
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 102
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
