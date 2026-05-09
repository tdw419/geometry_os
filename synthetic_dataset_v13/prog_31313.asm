; DESCRIPTION: Renders a blue line between points (23, 151) and (344, 191).
; PLAN: r0=23(x1), r1=151(y1), r2=344(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 151
LDI r2, 344
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
