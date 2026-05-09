; DESCRIPTION: Places a white line segment connecting (423, 128) to (135, 64).
; PLAN: r0=423(x1), r1=128(y1), r2=135(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 128
LDI r2, 135
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
