; DESCRIPTION: Places a white line segment connecting (191, 230) to (142, 94).
; PLAN: r0=191(x1), r1=230(y1), r2=142(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 230
LDI r2, 142
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
