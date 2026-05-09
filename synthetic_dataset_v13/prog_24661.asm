; DESCRIPTION: Places a white line segment connecting (314, 200) to (263, 253).
; PLAN: r0=314(x1), r1=200(y1), r2=263(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 200
LDI r2, 263
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
