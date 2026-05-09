; DESCRIPTION: Places a white line segment connecting (406, 122) to (442, 158).
; PLAN: r0=406(x1), r1=122(y1), r2=442(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 122
LDI r2, 442
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
