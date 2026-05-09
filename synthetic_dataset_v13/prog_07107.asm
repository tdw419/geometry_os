; DESCRIPTION: Places a white line segment connecting (498, 209) to (147, 136).
; PLAN: r0=498(x1), r1=209(y1), r2=147(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 209
LDI r2, 147
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
