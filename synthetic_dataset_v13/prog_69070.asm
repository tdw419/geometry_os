; DESCRIPTION: Places a black line segment connecting (499, 162) to (1, 177).
; PLAN: r0=499(x1), r1=162(y1), r2=1(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 162
LDI r2, 1
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
