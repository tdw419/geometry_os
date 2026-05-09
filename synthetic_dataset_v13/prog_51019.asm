; DESCRIPTION: Draws a white line from (227, 76) to (455, 160).
; PLAN: r0=227(x1), r1=76(y1), r2=455(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 76
LDI r2, 455
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
