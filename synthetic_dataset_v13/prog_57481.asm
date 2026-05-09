; DESCRIPTION: Draws a orange line from (440, 52) to (146, 208).
; PLAN: r0=440(x1), r1=52(y1), r2=146(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 52
LDI r2, 146
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
