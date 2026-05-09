; DESCRIPTION: Renders a orange line between points (356, 226) and (365, 233).
; PLAN: r0=356(x1), r1=226(y1), r2=365(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 226
LDI r2, 365
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
