; DESCRIPTION: Places a white line segment connecting (187, 15) to (312, 132).
; PLAN: r0=187(x1), r1=15(y1), r2=312(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 15
LDI r2, 312
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
