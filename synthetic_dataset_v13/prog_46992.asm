; DESCRIPTION: Places a red line segment connecting (98, 72) to (175, 2).
; PLAN: r0=98(x1), r1=72(y1), r2=175(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 72
LDI r2, 175
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
