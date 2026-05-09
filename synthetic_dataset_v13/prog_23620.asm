; DESCRIPTION: Places a cyan line segment connecting (476, 1) to (149, 225).
; PLAN: r0=476(x1), r1=1(y1), r2=149(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 1
LDI r2, 149
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
