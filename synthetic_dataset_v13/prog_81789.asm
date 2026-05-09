; DESCRIPTION: Places a green line segment connecting (38, 101) to (171, 68).
; PLAN: r0=38(x1), r1=101(y1), r2=171(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 101
LDI r2, 171
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
