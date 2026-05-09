; DESCRIPTION: Places a red line segment connecting (8, 178) to (435, 55).
; PLAN: r0=8(x1), r1=178(y1), r2=435(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 178
LDI r2, 435
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
