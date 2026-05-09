; DESCRIPTION: Places a red line segment connecting (220, 124) to (361, 77).
; PLAN: r0=220(x1), r1=124(y1), r2=361(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 124
LDI r2, 361
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
