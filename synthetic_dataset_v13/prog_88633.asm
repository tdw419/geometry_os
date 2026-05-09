; DESCRIPTION: Places a black line segment connecting (40, 110) to (474, 27).
; PLAN: r0=40(x1), r1=110(y1), r2=474(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 110
LDI r2, 474
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
