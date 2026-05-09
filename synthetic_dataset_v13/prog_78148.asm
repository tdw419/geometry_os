; DESCRIPTION: Places a white line segment connecting (214, 38) to (153, 66).
; PLAN: r0=214(x1), r1=38(y1), r2=153(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 38
LDI r2, 153
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
