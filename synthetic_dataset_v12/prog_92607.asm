; DESCRIPTION: Places a red line segment connecting (454, 203) to (300, 42).
; PLAN: r0=454(x1), r1=203(y1), r2=300(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 203
LDI r2, 300
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
