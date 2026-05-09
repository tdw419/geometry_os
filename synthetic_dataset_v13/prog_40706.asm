; DESCRIPTION: Draws a magenta line from (86, 189) to (98, 211).
; PLAN: r0=86(x1), r1=189(y1), r2=98(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 189
LDI r2, 98
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
