; DESCRIPTION: Places a yellow line segment connecting (90, 205) to (101, 14).
; PLAN: r0=90(x1), r1=205(y1), r2=101(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 205
LDI r2, 101
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
