; DESCRIPTION: Places a white line segment connecting (7, 237) to (377, 141).
; PLAN: r0=7(x1), r1=237(y1), r2=377(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 237
LDI r2, 377
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
