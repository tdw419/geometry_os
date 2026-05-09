; DESCRIPTION: Draws a green line from (338, 148) to (57, 136).
; PLAN: r0=338(x1), r1=148(y1), r2=57(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 148
LDI r2, 57
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
