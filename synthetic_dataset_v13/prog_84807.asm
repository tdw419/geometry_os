; DESCRIPTION: Places a green line segment connecting (65, 69) to (213, 22).
; PLAN: r0=65(x1), r1=69(y1), r2=213(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 69
LDI r2, 213
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
