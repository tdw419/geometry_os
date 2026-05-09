; DESCRIPTION: Places a red line segment connecting (498, 27) to (23, 118).
; PLAN: r0=498(x1), r1=27(y1), r2=23(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 27
LDI r2, 23
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
