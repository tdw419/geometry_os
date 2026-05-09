; DESCRIPTION: Places a white line segment connecting (215, 44) to (80, 112).
; PLAN: r0=215(x1), r1=44(y1), r2=80(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 44
LDI r2, 80
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
