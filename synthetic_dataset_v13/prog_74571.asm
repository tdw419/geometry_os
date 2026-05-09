; DESCRIPTION: Places a black line segment connecting (71, 222) to (175, 118).
; PLAN: r0=71(x1), r1=222(y1), r2=175(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 222
LDI r2, 175
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
