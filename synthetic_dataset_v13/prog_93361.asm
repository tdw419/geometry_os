; DESCRIPTION: Places a red line segment connecting (496, 209) to (106, 162).
; PLAN: r0=496(x1), r1=209(y1), r2=106(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 209
LDI r2, 106
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
