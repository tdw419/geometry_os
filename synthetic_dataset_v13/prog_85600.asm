; DESCRIPTION: Places a white line segment connecting (124, 9) to (382, 134).
; PLAN: r0=124(x1), r1=9(y1), r2=382(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 9
LDI r2, 382
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
