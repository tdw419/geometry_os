; DESCRIPTION: Draws a green line from (285, 136) to (265, 212).
; PLAN: r0=285(x1), r1=136(y1), r2=265(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 136
LDI r2, 265
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
