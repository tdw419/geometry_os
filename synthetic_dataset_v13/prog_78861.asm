; DESCRIPTION: Places a cyan line segment connecting (491, 77) to (238, 77).
; PLAN: r0=491(x1), r1=77(y1), r2=238(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 77
LDI r2, 238
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
