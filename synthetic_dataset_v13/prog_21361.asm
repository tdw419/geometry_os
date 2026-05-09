; DESCRIPTION: Renders a orange line between points (370, 93) and (448, 120).
; PLAN: r0=370(x1), r1=93(y1), r2=448(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 93
LDI r2, 448
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
