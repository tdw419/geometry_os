; DESCRIPTION: Places a white line segment connecting (105, 14) to (474, 37).
; PLAN: r0=105(x1), r1=14(y1), r2=474(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 14
LDI r2, 474
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
