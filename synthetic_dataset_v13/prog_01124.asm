; DESCRIPTION: Draws a orange line from (464, 202) to (188, 198).
; PLAN: r0=464(x1), r1=202(y1), r2=188(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 202
LDI r2, 188
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
