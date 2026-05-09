; DESCRIPTION: Renders a blue line between points (94, 132) and (18, 26).
; PLAN: r0=94(x1), r1=132(y1), r2=18(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 132
LDI r2, 18
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
