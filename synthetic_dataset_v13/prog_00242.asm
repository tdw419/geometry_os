; DESCRIPTION: Places a purple line segment connecting (207, 249) to (290, 161).
; PLAN: r0=207(x1), r1=249(y1), r2=290(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 249
LDI r2, 290
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
