; DESCRIPTION: Places a white line segment connecting (285, 118) to (207, 108).
; PLAN: r0=285(x1), r1=118(y1), r2=207(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 118
LDI r2, 207
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
