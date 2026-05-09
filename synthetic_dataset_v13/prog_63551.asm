; DESCRIPTION: Places a green line segment connecting (90, 7) to (116, 73).
; PLAN: r0=90(x1), r1=7(y1), r2=116(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 7
LDI r2, 116
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
