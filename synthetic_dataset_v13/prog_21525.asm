; DESCRIPTION: Draws a yellow line from (449, 59) to (357, 0).
; PLAN: r0=449(x1), r1=59(y1), r2=357(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 59
LDI r2, 357
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
