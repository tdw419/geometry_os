; DESCRIPTION: Renders a yellow line between points (151, 81) and (152, 58).
; PLAN: r0=151(x1), r1=81(y1), r2=152(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 81
LDI r2, 152
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
