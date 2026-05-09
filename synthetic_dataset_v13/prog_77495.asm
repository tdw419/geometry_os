; DESCRIPTION: Places a red line segment connecting (322, 242) to (163, 79).
; PLAN: r0=322(x1), r1=242(y1), r2=163(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 242
LDI r2, 163
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
