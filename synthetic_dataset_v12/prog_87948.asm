; DESCRIPTION: Places a white line segment connecting (69, 170) to (420, 54).
; PLAN: r0=69(x1), r1=170(y1), r2=420(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 170
LDI r2, 420
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
