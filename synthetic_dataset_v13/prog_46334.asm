; DESCRIPTION: Places a cyan line segment connecting (424, 83) to (411, 96).
; PLAN: r0=424(x1), r1=83(y1), r2=411(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 83
LDI r2, 411
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
