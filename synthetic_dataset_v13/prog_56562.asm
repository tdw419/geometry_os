; DESCRIPTION: Places a white line segment connecting (220, 33) to (490, 188).
; PLAN: r0=220(x1), r1=33(y1), r2=490(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 33
LDI r2, 490
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
