; DESCRIPTION: Places a white line segment connecting (285, 211) to (303, 97).
; PLAN: r0=285(x1), r1=211(y1), r2=303(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 211
LDI r2, 303
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
