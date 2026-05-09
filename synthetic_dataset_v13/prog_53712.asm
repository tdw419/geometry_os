; DESCRIPTION: Renders a yellow line between points (350, 75) and (72, 59).
; PLAN: r0=350(x1), r1=75(y1), r2=72(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 75
LDI r2, 72
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
