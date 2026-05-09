; DESCRIPTION: Places a green line segment connecting (260, 74) to (482, 98).
; PLAN: r0=260(x1), r1=74(y1), r2=482(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 74
LDI r2, 482
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
