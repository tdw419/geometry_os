; DESCRIPTION: Draws a white line from (385, 21) to (489, 136).
; PLAN: r0=385(x1), r1=21(y1), r2=489(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 21
LDI r2, 489
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
