; DESCRIPTION: Places a cyan line segment connecting (179, 33) to (90, 151).
; PLAN: r0=179(x1), r1=33(y1), r2=90(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 33
LDI r2, 90
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
