; DESCRIPTION: Places a green line segment connecting (183, 43) to (116, 237).
; PLAN: r0=183(x1), r1=43(y1), r2=116(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 43
LDI r2, 116
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
