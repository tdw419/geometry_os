; DESCRIPTION: Draws a blue line from (270, 157) to (330, 156).
; PLAN: r0=270(x1), r1=157(y1), r2=330(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 157
LDI r2, 330
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
