; DESCRIPTION: Renders a purple line between points (344, 1) and (202, 44).
; PLAN: r0=344(x1), r1=1(y1), r2=202(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 1
LDI r2, 202
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
