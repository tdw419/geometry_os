; DESCRIPTION: Places a red line segment connecting (117, 107) to (372, 104).
; PLAN: r0=117(x1), r1=107(y1), r2=372(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 107
LDI r2, 372
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
