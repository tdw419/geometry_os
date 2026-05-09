; DESCRIPTION: Places a red line segment connecting (263, 71) to (364, 109).
; PLAN: r0=263(x1), r1=71(y1), r2=364(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 71
LDI r2, 364
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
