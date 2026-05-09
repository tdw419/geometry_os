; DESCRIPTION: Places a red line segment connecting (228, 161) to (435, 116).
; PLAN: r0=228(x1), r1=161(y1), r2=435(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 161
LDI r2, 435
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
