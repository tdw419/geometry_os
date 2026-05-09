; DESCRIPTION: Draws a blue line from (153, 80) to (354, 156).
; PLAN: r0=153(x1), r1=80(y1), r2=354(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 80
LDI r2, 354
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
