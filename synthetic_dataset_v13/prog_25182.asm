; DESCRIPTION: Places a cyan line segment connecting (360, 49) to (345, 151).
; PLAN: r0=360(x1), r1=49(y1), r2=345(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 49
LDI r2, 345
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
