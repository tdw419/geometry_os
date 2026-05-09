; DESCRIPTION: Renders a yellow line between points (151, 178) and (84, 12).
; PLAN: r0=151(x1), r1=178(y1), r2=84(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 178
LDI r2, 84
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
