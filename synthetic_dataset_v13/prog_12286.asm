; DESCRIPTION: Renders a orange line between points (447, 150) and (165, 196).
; PLAN: r0=447(x1), r1=150(y1), r2=165(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 150
LDI r2, 165
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
