; DESCRIPTION: Places a red line segment connecting (498, 172) to (178, 94).
; PLAN: r0=498(x1), r1=172(y1), r2=178(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 172
LDI r2, 178
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
