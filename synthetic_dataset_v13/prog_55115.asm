; DESCRIPTION: Places a white line segment connecting (219, 200) to (405, 254).
; PLAN: r0=219(x1), r1=200(y1), r2=405(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 200
LDI r2, 405
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
