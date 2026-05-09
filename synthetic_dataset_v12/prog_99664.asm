; DESCRIPTION: Places a green line segment connecting (466, 230) to (69, 220).
; PLAN: r0=466(x1), r1=230(y1), r2=69(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 230
LDI r2, 69
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
