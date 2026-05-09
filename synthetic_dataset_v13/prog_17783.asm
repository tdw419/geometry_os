; DESCRIPTION: Composite: Renders a blue disk with center (104, 66) and radius 42 then Renders a black line between points (511, 160) and (4, 115).
; PLAN: r0=104(x), r1=66(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x1), r6=160(y1), r7=4(x2), r8=115(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 66
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 160
LDI r7, 4
LDI r8, 115
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
