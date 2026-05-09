; DESCRIPTION: Draws a magenta line from (59, 216) to (144, 244).
; PLAN: r0=59(x1), r1=216(y1), r2=144(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 216
LDI r2, 144
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
