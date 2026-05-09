; DESCRIPTION: Places a white line segment connecting (388, 188) to (247, 165).
; PLAN: r0=388(x1), r1=188(y1), r2=247(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 188
LDI r2, 247
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
