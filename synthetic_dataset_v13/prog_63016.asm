; DESCRIPTION: Places a red line segment connecting (368, 0) to (486, 64).
; PLAN: r0=368(x1), r1=0(y1), r2=486(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 0
LDI r2, 486
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
