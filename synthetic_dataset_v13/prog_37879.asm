; DESCRIPTION: Renders a cyan line between points (237, 118) and (448, 72).
; PLAN: r0=237(x1), r1=118(y1), r2=448(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 118
LDI r2, 448
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
