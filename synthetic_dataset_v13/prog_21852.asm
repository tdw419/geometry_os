; DESCRIPTION: Places a green line segment connecting (22, 71) to (116, 74).
; PLAN: r0=22(x1), r1=71(y1), r2=116(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 71
LDI r2, 116
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
