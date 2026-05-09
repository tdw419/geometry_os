; DESCRIPTION: Draws a magenta line from (188, 70) to (509, 184).
; PLAN: r0=188(x1), r1=70(y1), r2=509(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 70
LDI r2, 509
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
