; DESCRIPTION: Places a blue line segment connecting (358, 124) to (459, 187).
; PLAN: r0=358(x1), r1=124(y1), r2=459(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 124
LDI r2, 459
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
