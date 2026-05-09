; DESCRIPTION: Renders a yellow line between points (91, 183) and (482, 76).
; PLAN: r0=91(x1), r1=183(y1), r2=482(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 183
LDI r2, 482
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
