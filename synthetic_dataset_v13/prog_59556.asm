; DESCRIPTION: Places a red line segment connecting (246, 74) to (475, 59).
; PLAN: r0=246(x1), r1=74(y1), r2=475(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 74
LDI r2, 475
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
