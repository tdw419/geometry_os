; DESCRIPTION: Renders a black line between points (423, 130) and (83, 224).
; PLAN: r0=423(x1), r1=130(y1), r2=83(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 130
LDI r2, 83
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
