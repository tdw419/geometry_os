; DESCRIPTION: Places a red line segment connecting (272, 207) to (215, 104).
; PLAN: r0=272(x1), r1=207(y1), r2=215(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 207
LDI r2, 215
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
