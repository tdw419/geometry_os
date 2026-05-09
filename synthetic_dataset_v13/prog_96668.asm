; DESCRIPTION: Draws a orange line from (29, 229) to (70, 42).
; PLAN: r0=29(x1), r1=229(y1), r2=70(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 229
LDI r2, 70
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
