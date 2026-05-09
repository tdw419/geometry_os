; DESCRIPTION: Places a white line segment connecting (81, 124) to (138, 30).
; PLAN: r0=81(x1), r1=124(y1), r2=138(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 124
LDI r2, 138
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
