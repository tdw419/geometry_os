; DESCRIPTION: Draws a magenta line from (475, 18) to (319, 100).
; PLAN: r0=475(x1), r1=18(y1), r2=319(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 18
LDI r2, 319
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
