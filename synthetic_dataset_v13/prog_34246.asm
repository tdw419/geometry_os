; DESCRIPTION: Draws a magenta line from (328, 11) to (93, 33).
; PLAN: r0=328(x1), r1=11(y1), r2=93(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 11
LDI r2, 93
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
