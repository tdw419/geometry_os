; DESCRIPTION: Draws a magenta line from (122, 185) to (24, 167).
; PLAN: r0=122(x1), r1=185(y1), r2=24(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 185
LDI r2, 24
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
