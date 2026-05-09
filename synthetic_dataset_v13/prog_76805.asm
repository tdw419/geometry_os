; DESCRIPTION: Places a cyan line segment connecting (375, 249) to (482, 106).
; PLAN: r0=375(x1), r1=249(y1), r2=482(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 249
LDI r2, 482
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
