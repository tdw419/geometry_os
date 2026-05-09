; DESCRIPTION: Draws a magenta line from (115, 193) to (37, 47).
; PLAN: r0=115(x1), r1=193(y1), r2=37(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 193
LDI r2, 37
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
