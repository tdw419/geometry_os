; DESCRIPTION: Places a black line segment connecting (102, 252) to (465, 1).
; PLAN: r0=102(x1), r1=252(y1), r2=465(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 252
LDI r2, 465
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
