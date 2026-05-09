; DESCRIPTION: Places a cyan line segment connecting (181, 94) to (59, 162).
; PLAN: r0=181(x1), r1=94(y1), r2=59(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 94
LDI r2, 59
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
