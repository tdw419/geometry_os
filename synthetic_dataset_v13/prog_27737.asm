; DESCRIPTION: Draws a orange line from (183, 51) to (392, 4).
; PLAN: r0=183(x1), r1=51(y1), r2=392(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 51
LDI r2, 392
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
