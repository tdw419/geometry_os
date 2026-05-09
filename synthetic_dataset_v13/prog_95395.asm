; DESCRIPTION: Places a green line segment connecting (71, 203) to (369, 98).
; PLAN: r0=71(x1), r1=203(y1), r2=369(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 203
LDI r2, 369
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
