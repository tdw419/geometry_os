; DESCRIPTION: Draws a orange line from (487, 126) to (70, 145).
; PLAN: r0=487(x1), r1=126(y1), r2=70(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 126
LDI r2, 70
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
