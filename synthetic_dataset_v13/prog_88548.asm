; DESCRIPTION: Draws a magenta line from (76, 135) to (114, 199).
; PLAN: r0=76(x1), r1=135(y1), r2=114(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 135
LDI r2, 114
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
