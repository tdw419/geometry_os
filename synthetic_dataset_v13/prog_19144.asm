; DESCRIPTION: Places a white line segment connecting (221, 198) to (49, 209).
; PLAN: r0=221(x1), r1=198(y1), r2=49(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 198
LDI r2, 49
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
