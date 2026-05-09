; DESCRIPTION: Renders a green line between points (51, 162) and (501, 64).
; PLAN: r0=51(x1), r1=162(y1), r2=501(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 162
LDI r2, 501
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
