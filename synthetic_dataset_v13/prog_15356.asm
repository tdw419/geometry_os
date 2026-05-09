; DESCRIPTION: Draws a orange line from (336, 8) to (135, 168).
; PLAN: r0=336(x1), r1=8(y1), r2=135(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 8
LDI r2, 135
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
