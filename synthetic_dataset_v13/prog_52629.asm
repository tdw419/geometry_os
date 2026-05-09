; DESCRIPTION: Places a white line segment connecting (358, 188) to (424, 23).
; PLAN: r0=358(x1), r1=188(y1), r2=424(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 188
LDI r2, 424
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
