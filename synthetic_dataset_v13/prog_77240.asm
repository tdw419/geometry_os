; DESCRIPTION: Places a white line segment connecting (371, 32) to (11, 229).
; PLAN: r0=371(x1), r1=32(y1), r2=11(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 32
LDI r2, 11
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
