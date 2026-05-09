; DESCRIPTION: Places a white line segment connecting (34, 27) to (413, 128).
; PLAN: r0=34(x1), r1=27(y1), r2=413(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 27
LDI r2, 413
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
