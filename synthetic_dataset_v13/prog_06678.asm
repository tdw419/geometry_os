; DESCRIPTION: Places a green line segment connecting (492, 222) to (473, 39).
; PLAN: r0=492(x1), r1=222(y1), r2=473(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 222
LDI r2, 473
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
