; DESCRIPTION: Places a white line segment connecting (299, 32) to (116, 96).
; PLAN: r0=299(x1), r1=32(y1), r2=116(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 32
LDI r2, 116
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
