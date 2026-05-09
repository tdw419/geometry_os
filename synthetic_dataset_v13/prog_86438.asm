; DESCRIPTION: Draws a orange line from (120, 173) to (180, 119).
; PLAN: r0=120(x1), r1=173(y1), r2=180(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 173
LDI r2, 180
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
