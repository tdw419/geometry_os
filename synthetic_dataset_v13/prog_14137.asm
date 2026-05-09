; DESCRIPTION: Places a white line segment connecting (291, 112) to (88, 174).
; PLAN: r0=291(x1), r1=112(y1), r2=88(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 112
LDI r2, 88
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
