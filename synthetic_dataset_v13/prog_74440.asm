; DESCRIPTION: Places a white line segment connecting (59, 251) to (288, 163).
; PLAN: r0=59(x1), r1=251(y1), r2=288(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 251
LDI r2, 288
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
