; DESCRIPTION: Renders a yellow line between points (84, 172) and (188, 190).
; PLAN: r0=84(x1), r1=172(y1), r2=188(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 172
LDI r2, 188
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
