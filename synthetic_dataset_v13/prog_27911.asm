; DESCRIPTION: Places a purple line segment connecting (303, 124) to (21, 215).
; PLAN: r0=303(x1), r1=124(y1), r2=21(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 124
LDI r2, 21
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
