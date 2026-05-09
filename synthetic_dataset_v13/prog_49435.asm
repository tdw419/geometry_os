; DESCRIPTION: Places a white line segment connecting (460, 142) to (254, 179).
; PLAN: r0=460(x1), r1=142(y1), r2=254(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 142
LDI r2, 254
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
