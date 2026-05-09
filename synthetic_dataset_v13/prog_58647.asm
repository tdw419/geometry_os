; DESCRIPTION: Draws a orange line from (10, 220) to (392, 131).
; PLAN: r0=10(x1), r1=220(y1), r2=392(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 220
LDI r2, 392
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
