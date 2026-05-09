; DESCRIPTION: Renders a orange line between points (42, 84) and (428, 51).
; PLAN: r0=42(x1), r1=84(y1), r2=428(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 84
LDI r2, 428
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
