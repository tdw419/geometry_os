; DESCRIPTION: Draws a magenta line from (107, 188) to (233, 244).
; PLAN: r0=107(x1), r1=188(y1), r2=233(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 188
LDI r2, 233
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
