; DESCRIPTION: Places a cyan line segment connecting (400, 231) to (482, 163).
; PLAN: r0=400(x1), r1=231(y1), r2=482(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 231
LDI r2, 482
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
