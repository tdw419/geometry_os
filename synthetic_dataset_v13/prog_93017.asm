; DESCRIPTION: Draws a yellow line from (493, 145) to (0, 59).
; PLAN: r0=493(x1), r1=145(y1), r2=0(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 145
LDI r2, 0
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
