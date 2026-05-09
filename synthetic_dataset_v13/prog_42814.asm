; DESCRIPTION: Places a black line segment connecting (101, 62) to (470, 243).
; PLAN: r0=101(x1), r1=62(y1), r2=470(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 62
LDI r2, 470
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
