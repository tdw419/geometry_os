; DESCRIPTION: Places a red line segment connecting (442, 13) to (482, 104).
; PLAN: r0=442(x1), r1=13(y1), r2=482(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 13
LDI r2, 482
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
