; DESCRIPTION: Places a red line segment connecting (410, 104) to (142, 206).
; PLAN: r0=410(x1), r1=104(y1), r2=142(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 104
LDI r2, 142
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
