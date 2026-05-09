; DESCRIPTION: Draws a orange line from (439, 173) to (367, 85).
; PLAN: r0=439(x1), r1=173(y1), r2=367(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 173
LDI r2, 367
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
