; DESCRIPTION: Places a green line segment connecting (249, 186) to (175, 203).
; PLAN: r0=249(x1), r1=186(y1), r2=175(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 186
LDI r2, 175
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
