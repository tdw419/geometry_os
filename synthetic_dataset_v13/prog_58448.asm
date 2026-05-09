; DESCRIPTION: Renders a magenta line between points (23, 175) and (344, 158).
; PLAN: r0=23(x1), r1=175(y1), r2=344(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 175
LDI r2, 344
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
