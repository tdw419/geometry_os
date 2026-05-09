; DESCRIPTION: Places a white line segment connecting (33, 225) to (402, 169).
; PLAN: r0=33(x1), r1=225(y1), r2=402(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 225
LDI r2, 402
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
