; DESCRIPTION: Places a black line segment connecting (243, 25) to (277, 118).
; PLAN: r0=243(x1), r1=25(y1), r2=277(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 25
LDI r2, 277
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
