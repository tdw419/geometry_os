; DESCRIPTION: Renders a cyan line between points (448, 74) and (189, 72).
; PLAN: r0=448(x1), r1=74(y1), r2=189(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 74
LDI r2, 189
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
