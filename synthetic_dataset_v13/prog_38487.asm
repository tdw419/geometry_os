; DESCRIPTION: Places a cyan line segment connecting (233, 122) to (83, 67).
; PLAN: r0=233(x1), r1=122(y1), r2=83(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 122
LDI r2, 83
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
