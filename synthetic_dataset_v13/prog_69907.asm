; DESCRIPTION: Places a cyan line segment connecting (13, 222) to (134, 170).
; PLAN: r0=13(x1), r1=222(y1), r2=134(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 222
LDI r2, 134
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
