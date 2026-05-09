; DESCRIPTION: Places a green line segment connecting (482, 230) to (68, 242).
; PLAN: r0=482(x1), r1=230(y1), r2=68(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 230
LDI r2, 68
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
