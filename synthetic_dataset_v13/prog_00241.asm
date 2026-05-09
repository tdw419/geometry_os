; DESCRIPTION: Places a red line segment connecting (402, 79) to (203, 124).
; PLAN: r0=402(x1), r1=79(y1), r2=203(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 79
LDI r2, 203
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
