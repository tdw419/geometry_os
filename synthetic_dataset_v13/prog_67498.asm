; DESCRIPTION: Renders a orange line between points (226, 193) and (79, 144).
; PLAN: r0=226(x1), r1=193(y1), r2=79(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 193
LDI r2, 79
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
