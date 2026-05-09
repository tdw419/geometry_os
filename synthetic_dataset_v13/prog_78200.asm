; DESCRIPTION: Places a white line segment connecting (445, 166) to (331, 123).
; PLAN: r0=445(x1), r1=166(y1), r2=331(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 166
LDI r2, 331
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
