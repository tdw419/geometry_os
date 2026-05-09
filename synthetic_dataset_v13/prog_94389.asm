; DESCRIPTION: Renders a orange line between points (447, 93) and (196, 200).
; PLAN: r0=447(x1), r1=93(y1), r2=196(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 93
LDI r2, 196
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
