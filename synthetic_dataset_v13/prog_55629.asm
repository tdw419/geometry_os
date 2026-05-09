; DESCRIPTION: Draws a magenta line from (71, 46) to (140, 94).
; PLAN: r0=71(x1), r1=46(y1), r2=140(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 46
LDI r2, 140
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
