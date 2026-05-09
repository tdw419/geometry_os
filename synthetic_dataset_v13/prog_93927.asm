; DESCRIPTION: Places a yellow line segment connecting (370, 81) to (166, 243).
; PLAN: r0=370(x1), r1=81(y1), r2=166(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 81
LDI r2, 166
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
