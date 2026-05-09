; DESCRIPTION: Places a red line segment connecting (435, 67) to (76, 166).
; PLAN: r0=435(x1), r1=67(y1), r2=76(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 67
LDI r2, 76
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
