; DESCRIPTION: Draws a orange line from (392, 150) to (201, 128).
; PLAN: r0=392(x1), r1=150(y1), r2=201(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 150
LDI r2, 201
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
