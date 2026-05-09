; DESCRIPTION: Places a green line segment connecting (482, 62) to (65, 61).
; PLAN: r0=482(x1), r1=62(y1), r2=65(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 62
LDI r2, 65
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
