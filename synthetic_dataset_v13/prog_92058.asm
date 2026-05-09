; DESCRIPTION: Places a purple line segment connecting (170, 186) to (280, 29).
; PLAN: r0=170(x1), r1=186(y1), r2=280(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 186
LDI r2, 280
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
