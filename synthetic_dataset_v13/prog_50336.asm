; DESCRIPTION: Draws a yellow line from (414, 7) to (345, 222).
; PLAN: r0=414(x1), r1=7(y1), r2=345(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 7
LDI r2, 345
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
