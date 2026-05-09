; DESCRIPTION: Places a white line segment connecting (273, 2) to (442, 2).
; PLAN: r0=273(x1), r1=2(y1), r2=442(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 2
LDI r2, 442
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
