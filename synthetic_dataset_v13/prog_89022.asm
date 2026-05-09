; DESCRIPTION: Draws a yellow line from (320, 212) to (114, 136).
; PLAN: r0=320(x1), r1=212(y1), r2=114(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 212
LDI r2, 114
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
