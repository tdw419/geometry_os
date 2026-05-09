; DESCRIPTION: Places a cyan line segment connecting (119, 88) to (371, 9).
; PLAN: r0=119(x1), r1=88(y1), r2=371(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 88
LDI r2, 371
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
