; DESCRIPTION: Places a green line segment connecting (110, 103) to (442, 84).
; PLAN: r0=110(x1), r1=103(y1), r2=442(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 103
LDI r2, 442
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
