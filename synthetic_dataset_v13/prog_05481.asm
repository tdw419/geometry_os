; DESCRIPTION: Places a white line segment connecting (72, 103) to (52, 34).
; PLAN: r0=72(x1), r1=103(y1), r2=52(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 103
LDI r2, 52
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
