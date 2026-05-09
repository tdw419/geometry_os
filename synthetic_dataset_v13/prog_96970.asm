; DESCRIPTION: Renders a cyan line between points (118, 23) and (448, 38).
; PLAN: r0=118(x1), r1=23(y1), r2=448(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 23
LDI r2, 448
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
