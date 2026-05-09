; DESCRIPTION: Places a cyan line segment connecting (381, 116) to (204, 88).
; PLAN: r0=381(x1), r1=116(y1), r2=204(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 116
LDI r2, 204
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
