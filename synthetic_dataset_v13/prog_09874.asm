; DESCRIPTION: Renders a blue line between points (332, 211) and (71, 128).
; PLAN: r0=332(x1), r1=211(y1), r2=71(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 211
LDI r2, 71
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
