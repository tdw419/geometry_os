; DESCRIPTION: Places a red line segment connecting (157, 95) to (322, 47).
; PLAN: r0=157(x1), r1=95(y1), r2=322(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 95
LDI r2, 322
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
