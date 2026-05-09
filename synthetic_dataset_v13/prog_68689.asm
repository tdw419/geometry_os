; DESCRIPTION: Places a green line segment connecting (181, 166) to (147, 134).
; PLAN: r0=181(x1), r1=166(y1), r2=147(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 166
LDI r2, 147
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
