; DESCRIPTION: Places a purple line segment connecting (7, 186) to (344, 154).
; PLAN: r0=7(x1), r1=186(y1), r2=344(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 186
LDI r2, 344
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
