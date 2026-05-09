; DESCRIPTION: Places a white line segment connecting (187, 9) to (288, 139).
; PLAN: r0=187(x1), r1=9(y1), r2=288(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 9
LDI r2, 288
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
