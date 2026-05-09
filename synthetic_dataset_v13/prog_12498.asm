; DESCRIPTION: Places a red line segment connecting (402, 65) to (65, 182).
; PLAN: r0=402(x1), r1=65(y1), r2=65(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 65
LDI r2, 65
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
