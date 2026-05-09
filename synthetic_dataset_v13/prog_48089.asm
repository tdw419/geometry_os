; DESCRIPTION: Places a red line segment connecting (364, 149) to (510, 17).
; PLAN: r0=364(x1), r1=149(y1), r2=510(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 149
LDI r2, 510
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
