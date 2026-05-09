; DESCRIPTION: Places a white line segment connecting (266, 44) to (229, 172).
; PLAN: r0=266(x1), r1=44(y1), r2=229(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 44
LDI r2, 229
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
