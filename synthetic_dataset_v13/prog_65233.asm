; DESCRIPTION: Places a white line segment connecting (407, 31) to (177, 173).
; PLAN: r0=407(x1), r1=31(y1), r2=177(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 31
LDI r2, 177
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
