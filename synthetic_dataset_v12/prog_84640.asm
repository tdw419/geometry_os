; DESCRIPTION: Places a white line segment connecting (312, 129) to (19, 3).
; PLAN: r0=312(x1), r1=129(y1), r2=19(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 129
LDI r2, 19
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
