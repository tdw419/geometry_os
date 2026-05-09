; DESCRIPTION: Renders a green line between points (196, 179) and (110, 51).
; PLAN: r0=196(x1), r1=179(y1), r2=110(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 179
LDI r2, 110
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
