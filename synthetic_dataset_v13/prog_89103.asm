; DESCRIPTION: Renders a black line between points (84, 161) and (362, 89).
; PLAN: r0=84(x1), r1=161(y1), r2=362(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 161
LDI r2, 362
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
