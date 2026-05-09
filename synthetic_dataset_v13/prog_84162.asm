; DESCRIPTION: Places a magenta line segment connecting (285, 165) to (370, 189).
; PLAN: r0=285(x1), r1=165(y1), r2=370(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 165
LDI r2, 370
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
