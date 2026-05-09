; DESCRIPTION: Places a yellow line segment connecting (243, 251) to (274, 152).
; PLAN: r0=243(x1), r1=251(y1), r2=274(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 251
LDI r2, 274
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
