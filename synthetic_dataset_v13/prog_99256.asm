; DESCRIPTION: Places a red line segment connecting (234, 73) to (501, 146).
; PLAN: r0=234(x1), r1=73(y1), r2=501(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 73
LDI r2, 501
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
