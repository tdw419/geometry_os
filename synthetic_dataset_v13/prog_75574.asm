; DESCRIPTION: Draws a yellow line from (289, 94) to (206, 194).
; PLAN: r0=289(x1), r1=94(y1), r2=206(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 94
LDI r2, 206
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
