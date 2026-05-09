; DESCRIPTION: Places a white line segment connecting (306, 58) to (442, 68).
; PLAN: r0=306(x1), r1=58(y1), r2=442(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 58
LDI r2, 442
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
