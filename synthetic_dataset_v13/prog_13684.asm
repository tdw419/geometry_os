; DESCRIPTION: Renders a blue line between points (281, 237) and (363, 121).
; PLAN: r0=281(x1), r1=237(y1), r2=363(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 237
LDI r2, 363
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
