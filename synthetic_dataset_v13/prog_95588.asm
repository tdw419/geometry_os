; DESCRIPTION: Draws a magenta line from (34, 33) to (12, 63).
; PLAN: r0=34(x1), r1=33(y1), r2=12(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 33
LDI r2, 12
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
