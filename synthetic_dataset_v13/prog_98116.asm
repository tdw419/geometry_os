; DESCRIPTION: Places a white line segment connecting (463, 33) to (267, 106).
; PLAN: r0=463(x1), r1=33(y1), r2=267(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 33
LDI r2, 267
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
