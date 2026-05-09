; DESCRIPTION: Places a red line segment connecting (149, 196) to (184, 224).
; PLAN: r0=149(x1), r1=196(y1), r2=184(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 196
LDI r2, 184
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
