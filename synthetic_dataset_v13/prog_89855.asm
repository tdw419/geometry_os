; DESCRIPTION: Places a red line segment connecting (303, 85) to (167, 44).
; PLAN: r0=303(x1), r1=85(y1), r2=167(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 85
LDI r2, 167
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
