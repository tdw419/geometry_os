; DESCRIPTION: Draws a yellow line from (414, 57) to (97, 255).
; PLAN: r0=414(x1), r1=57(y1), r2=97(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 57
LDI r2, 97
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
