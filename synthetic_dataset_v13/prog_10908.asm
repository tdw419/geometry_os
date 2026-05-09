; DESCRIPTION: Draws a blue line from (33, 195) to (506, 203).
; PLAN: r0=33(x1), r1=195(y1), r2=506(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 195
LDI r2, 506
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
