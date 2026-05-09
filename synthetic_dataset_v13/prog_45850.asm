; DESCRIPTION: Places a red line segment connecting (338, 112) to (192, 83).
; PLAN: r0=338(x1), r1=112(y1), r2=192(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 112
LDI r2, 192
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
