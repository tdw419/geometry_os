; DESCRIPTION: Draws a magenta line from (310, 25) to (508, 182).
; PLAN: r0=310(x1), r1=25(y1), r2=508(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 25
LDI r2, 508
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
