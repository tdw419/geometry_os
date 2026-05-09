; DESCRIPTION: Renders a yellow line between points (72, 122) and (375, 244).
; PLAN: r0=72(x1), r1=122(y1), r2=375(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 122
LDI r2, 375
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
