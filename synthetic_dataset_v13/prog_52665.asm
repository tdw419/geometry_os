; DESCRIPTION: Places a black line segment connecting (360, 28) to (82, 62).
; PLAN: r0=360(x1), r1=28(y1), r2=82(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 28
LDI r2, 82
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
