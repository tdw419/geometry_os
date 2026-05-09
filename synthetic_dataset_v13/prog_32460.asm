; DESCRIPTION: Places a white line segment connecting (321, 28) to (291, 7).
; PLAN: r0=321(x1), r1=28(y1), r2=291(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 28
LDI r2, 291
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
