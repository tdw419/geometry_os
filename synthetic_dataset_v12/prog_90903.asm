; DESCRIPTION: Places a white line segment connecting (356, 214) to (205, 37).
; PLAN: r0=356(x1), r1=214(y1), r2=205(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 214
LDI r2, 205
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
