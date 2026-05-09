; DESCRIPTION: Places a cyan line segment connecting (456, 40) to (315, 133).
; PLAN: r0=456(x1), r1=40(y1), r2=315(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 40
LDI r2, 315
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
