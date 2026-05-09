; DESCRIPTION: Places a red line segment connecting (179, 29) to (347, 166).
; PLAN: r0=179(x1), r1=29(y1), r2=347(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 29
LDI r2, 347
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
