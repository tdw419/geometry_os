; DESCRIPTION: Places a red line segment connecting (269, 104) to (38, 197).
; PLAN: r0=269(x1), r1=104(y1), r2=38(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 104
LDI r2, 38
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
