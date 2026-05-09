; DESCRIPTION: Places a white line segment connecting (128, 25) to (61, 133).
; PLAN: r0=128(x1), r1=25(y1), r2=61(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 25
LDI r2, 61
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
