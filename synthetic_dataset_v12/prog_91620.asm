; DESCRIPTION: Places a white line segment connecting (170, 9) to (160, 6).
; PLAN: r0=170(x1), r1=9(y1), r2=160(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 9
LDI r2, 160
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
