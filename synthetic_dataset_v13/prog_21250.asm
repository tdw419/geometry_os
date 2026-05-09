; DESCRIPTION: Draws a blue line from (111, 7) to (283, 47).
; PLAN: r0=111(x1), r1=7(y1), r2=283(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 7
LDI r2, 283
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
