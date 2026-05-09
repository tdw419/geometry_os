; DESCRIPTION: Places a white line segment connecting (206, 90) to (40, 77).
; PLAN: r0=206(x1), r1=90(y1), r2=40(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 90
LDI r2, 40
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
