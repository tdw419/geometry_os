; DESCRIPTION: Draws a green line from (455, 148) to (77, 13).
; PLAN: r0=455(x1), r1=148(y1), r2=77(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 148
LDI r2, 77
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
