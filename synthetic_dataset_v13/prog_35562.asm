; DESCRIPTION: Places a purple line segment connecting (225, 135) to (492, 76).
; PLAN: r0=225(x1), r1=135(y1), r2=492(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 135
LDI r2, 492
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
