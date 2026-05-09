; DESCRIPTION: Draws a orange line from (440, 115) to (336, 150).
; PLAN: r0=440(x1), r1=115(y1), r2=336(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 115
LDI r2, 336
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
