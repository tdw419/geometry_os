; DESCRIPTION: Places a white line segment connecting (178, 63) to (423, 144).
; PLAN: r0=178(x1), r1=63(y1), r2=423(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 63
LDI r2, 423
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
