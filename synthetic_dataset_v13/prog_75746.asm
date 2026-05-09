; DESCRIPTION: Places a red line segment connecting (243, 112) to (338, 68).
; PLAN: r0=243(x1), r1=112(y1), r2=338(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 112
LDI r2, 338
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
