; DESCRIPTION: Places a white line segment connecting (2, 82) to (482, 231).
; PLAN: r0=2(x1), r1=82(y1), r2=482(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 82
LDI r2, 482
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
