; DESCRIPTION: Places a white line segment connecting (356, 172) to (77, 166).
; PLAN: r0=356(x1), r1=172(y1), r2=77(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 172
LDI r2, 77
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
