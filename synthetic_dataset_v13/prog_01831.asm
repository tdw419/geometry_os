; DESCRIPTION: Places a white line segment connecting (181, 42) to (77, 179).
; PLAN: r0=181(x1), r1=42(y1), r2=77(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 42
LDI r2, 77
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
