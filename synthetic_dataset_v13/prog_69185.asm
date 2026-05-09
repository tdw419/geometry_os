; DESCRIPTION: Places a cyan line segment connecting (6, 17) to (366, 3).
; PLAN: r0=6(x1), r1=17(y1), r2=366(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 17
LDI r2, 366
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
