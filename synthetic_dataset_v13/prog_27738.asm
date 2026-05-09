; DESCRIPTION: Places a cyan line segment connecting (409, 66) to (122, 116).
; PLAN: r0=409(x1), r1=66(y1), r2=122(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 66
LDI r2, 122
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
