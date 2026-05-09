; DESCRIPTION: Places a blue line segment connecting (492, 186) to (166, 31).
; PLAN: r0=492(x1), r1=186(y1), r2=166(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 186
LDI r2, 166
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
