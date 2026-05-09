; DESCRIPTION: Places a white line segment connecting (90, 27) to (407, 64).
; PLAN: r0=90(x1), r1=27(y1), r2=407(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 27
LDI r2, 407
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
