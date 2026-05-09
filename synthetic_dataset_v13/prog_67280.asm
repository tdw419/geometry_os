; DESCRIPTION: Places a white line segment connecting (188, 174) to (185, 45).
; PLAN: r0=188(x1), r1=174(y1), r2=185(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 174
LDI r2, 185
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
