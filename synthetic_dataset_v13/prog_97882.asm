; DESCRIPTION: Draws a magenta line from (475, 40) to (310, 0).
; PLAN: r0=475(x1), r1=40(y1), r2=310(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 40
LDI r2, 310
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
