; DESCRIPTION: Places a yellow line segment connecting (455, 166) to (66, 105).
; PLAN: r0=455(x1), r1=166(y1), r2=66(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 166
LDI r2, 66
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
