; DESCRIPTION: Places a black line segment connecting (328, 33) to (77, 253).
; PLAN: r0=328(x1), r1=33(y1), r2=77(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 33
LDI r2, 77
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
