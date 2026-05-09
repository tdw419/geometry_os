; DESCRIPTION: Places a white line segment connecting (466, 92) to (443, 224).
; PLAN: r0=466(x1), r1=92(y1), r2=443(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 92
LDI r2, 443
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
