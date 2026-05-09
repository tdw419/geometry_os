; DESCRIPTION: Places a white line segment connecting (455, 165) to (137, 40).
; PLAN: r0=455(x1), r1=165(y1), r2=137(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 165
LDI r2, 137
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
