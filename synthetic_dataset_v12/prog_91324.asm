; DESCRIPTION: Renders a black line between points (310, 112) and (144, 188).
; PLAN: r0=310(x1), r1=112(y1), r2=144(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 112
LDI r2, 144
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
