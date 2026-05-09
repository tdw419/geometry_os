; DESCRIPTION: Draws a red line from (181, 193) to (509, 123).
; PLAN: r0=181(x1), r1=193(y1), r2=509(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 193
LDI r2, 509
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
