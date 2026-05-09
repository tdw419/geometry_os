; DESCRIPTION: Places a red line segment connecting (382, 172) to (254, 99).
; PLAN: r0=382(x1), r1=172(y1), r2=254(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 172
LDI r2, 254
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
