; DESCRIPTION: Draws a white line from (450, 226) to (212, 123).
; PLAN: r0=450(x1), r1=226(y1), r2=212(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 226
LDI r2, 212
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
