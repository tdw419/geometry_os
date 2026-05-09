; DESCRIPTION: Places a black line segment connecting (268, 64) to (503, 205).
; PLAN: r0=268(x1), r1=64(y1), r2=503(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 64
LDI r2, 503
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
