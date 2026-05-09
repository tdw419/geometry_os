; DESCRIPTION: Places a cyan line segment connecting (38, 155) to (174, 157).
; PLAN: r0=38(x1), r1=155(y1), r2=174(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 155
LDI r2, 174
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
