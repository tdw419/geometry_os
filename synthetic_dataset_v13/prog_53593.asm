; DESCRIPTION: Places a red line segment connecting (469, 148) to (197, 144).
; PLAN: r0=469(x1), r1=148(y1), r2=197(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 148
LDI r2, 197
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
