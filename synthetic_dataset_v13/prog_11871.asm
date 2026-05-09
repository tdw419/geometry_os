; DESCRIPTION: Places a red line segment connecting (474, 202) to (449, 106).
; PLAN: r0=474(x1), r1=202(y1), r2=449(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 202
LDI r2, 449
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
