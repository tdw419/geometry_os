; DESCRIPTION: Places a red line segment connecting (210, 185) to (309, 197).
; PLAN: r0=210(x1), r1=185(y1), r2=309(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 185
LDI r2, 309
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
