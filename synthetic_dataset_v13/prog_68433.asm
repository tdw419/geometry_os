; DESCRIPTION: Places a white line segment connecting (64, 150) to (48, 77).
; PLAN: r0=64(x1), r1=150(y1), r2=48(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 150
LDI r2, 48
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
