; DESCRIPTION: Places a cyan line segment connecting (505, 222) to (407, 188).
; PLAN: r0=505(x1), r1=222(y1), r2=407(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 222
LDI r2, 407
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
