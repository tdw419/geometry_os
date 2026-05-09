; DESCRIPTION: Places a white line segment connecting (124, 124) to (52, 39).
; PLAN: r0=124(x1), r1=124(y1), r2=52(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 124
LDI r2, 52
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
