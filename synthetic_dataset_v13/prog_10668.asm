; DESCRIPTION: Draws a blue line from (354, 59) to (77, 229).
; PLAN: r0=354(x1), r1=59(y1), r2=77(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 59
LDI r2, 77
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
