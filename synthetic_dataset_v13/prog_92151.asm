; DESCRIPTION: Places a white line segment connecting (269, 101) to (458, 69).
; PLAN: r0=269(x1), r1=101(y1), r2=458(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 101
LDI r2, 458
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
