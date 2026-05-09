; DESCRIPTION: Places a red line segment connecting (420, 54) to (368, 66).
; PLAN: r0=420(x1), r1=54(y1), r2=368(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 54
LDI r2, 368
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
