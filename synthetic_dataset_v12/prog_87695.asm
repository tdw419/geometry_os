; DESCRIPTION: Places a cyan line segment connecting (158, 255) to (15, 178).
; PLAN: r0=158(x1), r1=255(y1), r2=15(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 255
LDI r2, 15
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
