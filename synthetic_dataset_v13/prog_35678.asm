; DESCRIPTION: Places a black line segment connecting (74, 124) to (12, 120).
; PLAN: r0=74(x1), r1=124(y1), r2=12(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 124
LDI r2, 12
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
