; DESCRIPTION: Places a cyan line segment connecting (96, 67) to (411, 106).
; PLAN: r0=96(x1), r1=67(y1), r2=411(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 67
LDI r2, 411
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
