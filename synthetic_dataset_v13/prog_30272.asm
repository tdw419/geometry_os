; DESCRIPTION: Places a red line segment connecting (305, 176) to (157, 3).
; PLAN: r0=305(x1), r1=176(y1), r2=157(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 176
LDI r2, 157
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
