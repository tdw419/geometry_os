; DESCRIPTION: Places a red line segment connecting (188, 157) to (301, 243).
; PLAN: r0=188(x1), r1=157(y1), r2=301(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 157
LDI r2, 301
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
