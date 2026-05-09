; DESCRIPTION: Places a red line segment connecting (486, 44) to (265, 38).
; PLAN: r0=486(x1), r1=44(y1), r2=265(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 44
LDI r2, 265
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
