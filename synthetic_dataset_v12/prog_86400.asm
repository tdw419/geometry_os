; DESCRIPTION: Draws a yellow line from (414, 175) to (280, 162).
; PLAN: r0=414(x1), r1=175(y1), r2=280(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 175
LDI r2, 280
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
