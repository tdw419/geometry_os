; DESCRIPTION: Places a white line segment connecting (500, 8) to (442, 83).
; PLAN: r0=500(x1), r1=8(y1), r2=442(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 8
LDI r2, 442
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
