; DESCRIPTION: Places a white line segment connecting (504, 19) to (283, 254).
; PLAN: r0=504(x1), r1=19(y1), r2=283(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 19
LDI r2, 283
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
