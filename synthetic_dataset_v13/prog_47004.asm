; DESCRIPTION: Renders a green line between points (90, 251) and (132, 219).
; PLAN: r0=90(x1), r1=251(y1), r2=132(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 251
LDI r2, 132
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
