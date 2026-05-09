; DESCRIPTION: Places a white line segment connecting (260, 225) to (20, 176).
; PLAN: r0=260(x1), r1=225(y1), r2=20(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 225
LDI r2, 20
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
