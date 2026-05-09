; DESCRIPTION: Places a green line segment connecting (342, 104) to (197, 188).
; PLAN: r0=342(x1), r1=104(y1), r2=197(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 104
LDI r2, 197
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
