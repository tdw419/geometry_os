; DESCRIPTION: Places a black line segment connecting (13, 112) to (25, 182).
; PLAN: r0=13(x1), r1=112(y1), r2=25(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 112
LDI r2, 25
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
