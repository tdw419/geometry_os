; DESCRIPTION: Places a white line segment connecting (76, 166) to (56, 208).
; PLAN: r0=76(x1), r1=166(y1), r2=56(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 166
LDI r2, 56
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
