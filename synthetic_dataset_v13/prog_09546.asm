; DESCRIPTION: Draws a white line from (212, 63) to (99, 211).
; PLAN: r0=212(x1), r1=63(y1), r2=99(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 63
LDI r2, 99
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
