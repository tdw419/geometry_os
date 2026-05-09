; DESCRIPTION: Places a white line segment connecting (250, 83) to (160, 50).
; PLAN: r0=250(x1), r1=83(y1), r2=160(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 83
LDI r2, 160
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
