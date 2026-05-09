; DESCRIPTION: Places a white line segment connecting (45, 144) to (102, 223).
; PLAN: r0=45(x1), r1=144(y1), r2=102(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 144
LDI r2, 102
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
