; DESCRIPTION: Places a red line segment connecting (91, 16) to (309, 136).
; PLAN: r0=91(x1), r1=16(y1), r2=309(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 16
LDI r2, 309
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
