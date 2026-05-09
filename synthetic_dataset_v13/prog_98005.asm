; DESCRIPTION: Draws a magenta line from (313, 90) to (436, 156).
; PLAN: r0=313(x1), r1=90(y1), r2=436(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 90
LDI r2, 436
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
