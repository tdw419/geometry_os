; DESCRIPTION: Places a white line segment connecting (218, 123) to (382, 132).
; PLAN: r0=218(x1), r1=123(y1), r2=382(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 123
LDI r2, 382
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
