; DESCRIPTION: Renders a yellow line between points (15, 152) and (289, 200).
; PLAN: r0=15(x1), r1=152(y1), r2=289(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 152
LDI r2, 289
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
