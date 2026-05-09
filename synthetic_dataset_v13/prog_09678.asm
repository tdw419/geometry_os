; DESCRIPTION: Renders a magenta line between points (177, 122) and (46, 105).
; PLAN: r0=177(x1), r1=122(y1), r2=46(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 122
LDI r2, 46
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
