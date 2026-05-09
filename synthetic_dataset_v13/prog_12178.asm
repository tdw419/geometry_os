; DESCRIPTION: Places a red line segment connecting (203, 26) to (210, 28).
; PLAN: r0=203(x1), r1=26(y1), r2=210(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 26
LDI r2, 210
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
