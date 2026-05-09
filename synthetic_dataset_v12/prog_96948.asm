; DESCRIPTION: Places a white line segment connecting (387, 170) to (473, 87).
; PLAN: r0=387(x1), r1=170(y1), r2=473(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 170
LDI r2, 473
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
