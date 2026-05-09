; DESCRIPTION: Places a red line segment connecting (104, 103) to (411, 187).
; PLAN: r0=104(x1), r1=103(y1), r2=411(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 103
LDI r2, 411
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
