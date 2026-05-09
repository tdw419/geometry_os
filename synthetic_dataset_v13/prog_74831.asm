; DESCRIPTION: Places a black line segment connecting (268, 63) to (474, 162).
; PLAN: r0=268(x1), r1=63(y1), r2=474(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 63
LDI r2, 474
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
