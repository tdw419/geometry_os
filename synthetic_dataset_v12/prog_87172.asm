; DESCRIPTION: Renders a cyan line between points (387, 118) and (377, 229).
; PLAN: r0=387(x1), r1=118(y1), r2=377(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 118
LDI r2, 377
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
