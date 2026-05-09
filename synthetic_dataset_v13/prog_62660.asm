; DESCRIPTION: Composite: Renders a green line between points (244, 118) and (356, 130) then Places a red circle of radius 80 at center (85, 107).
; PLAN: r0=244(x1), r1=118(y1), r2=356(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=107(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 244
LDI r1, 118
LDI r2, 356
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 107
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
