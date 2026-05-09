; DESCRIPTION: Places a red line segment connecting (470, 12) to (173, 97).
; PLAN: r0=470(x1), r1=12(y1), r2=173(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 12
LDI r2, 173
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
