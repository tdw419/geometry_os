; DESCRIPTION: Places a red line segment connecting (77, 0) to (85, 173).
; PLAN: r0=77(x1), r1=0(y1), r2=85(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 0
LDI r2, 85
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
