; DESCRIPTION: Places a red line segment connecting (212, 171) to (340, 77).
; PLAN: r0=212(x1), r1=171(y1), r2=340(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 171
LDI r2, 340
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
