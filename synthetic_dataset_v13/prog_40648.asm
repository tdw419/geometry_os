; DESCRIPTION: Draws a magenta line from (192, 49) to (39, 208).
; PLAN: r0=192(x1), r1=49(y1), r2=39(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 49
LDI r2, 39
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
