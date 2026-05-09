; DESCRIPTION: Draws a magenta line from (205, 206) to (140, 222).
; PLAN: r0=205(x1), r1=206(y1), r2=140(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 206
LDI r2, 140
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
