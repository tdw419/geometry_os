; DESCRIPTION: Draws a magenta line from (345, 186) to (61, 140).
; PLAN: r0=345(x1), r1=186(y1), r2=61(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 186
LDI r2, 61
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
