; DESCRIPTION: Places a white line segment connecting (54, 53) to (493, 15).
; PLAN: r0=54(x1), r1=53(y1), r2=493(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 53
LDI r2, 493
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
