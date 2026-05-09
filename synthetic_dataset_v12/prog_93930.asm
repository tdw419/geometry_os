; DESCRIPTION: Places a cyan line segment connecting (390, 135) to (505, 76).
; PLAN: r0=390(x1), r1=135(y1), r2=505(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 135
LDI r2, 505
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
