; DESCRIPTION: Places a red line segment connecting (288, 230) to (155, 134).
; PLAN: r0=288(x1), r1=230(y1), r2=155(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 230
LDI r2, 155
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
