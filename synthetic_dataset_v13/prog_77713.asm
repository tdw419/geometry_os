; DESCRIPTION: Draws a orange line from (193, 117) to (120, 0).
; PLAN: r0=193(x1), r1=117(y1), r2=120(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 117
LDI r2, 120
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
