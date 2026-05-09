; DESCRIPTION: Places a red line segment connecting (230, 29) to (172, 24).
; PLAN: r0=230(x1), r1=29(y1), r2=172(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 29
LDI r2, 172
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
