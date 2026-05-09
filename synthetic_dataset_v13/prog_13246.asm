; DESCRIPTION: Draws a magenta line from (290, 63) to (423, 71).
; PLAN: r0=290(x1), r1=63(y1), r2=423(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 63
LDI r2, 423
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
