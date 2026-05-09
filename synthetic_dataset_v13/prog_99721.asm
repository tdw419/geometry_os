; DESCRIPTION: Places a red line segment connecting (393, 174) to (101, 197).
; PLAN: r0=393(x1), r1=174(y1), r2=101(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 174
LDI r2, 101
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
