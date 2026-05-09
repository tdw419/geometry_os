; DESCRIPTION: Draws a yellow line from (289, 11) to (33, 4).
; PLAN: r0=289(x1), r1=11(y1), r2=33(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 11
LDI r2, 33
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
