; DESCRIPTION: Places a cyan line segment connecting (490, 16) to (105, 33).
; PLAN: r0=490(x1), r1=16(y1), r2=105(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 16
LDI r2, 105
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
