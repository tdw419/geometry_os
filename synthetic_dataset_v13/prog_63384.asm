; DESCRIPTION: Places a red line segment connecting (270, 28) to (13, 142).
; PLAN: r0=270(x1), r1=28(y1), r2=13(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 28
LDI r2, 13
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
