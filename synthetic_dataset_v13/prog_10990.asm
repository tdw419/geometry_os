; DESCRIPTION: Places a green line segment connecting (292, 249) to (482, 220).
; PLAN: r0=292(x1), r1=249(y1), r2=482(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 249
LDI r2, 482
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
