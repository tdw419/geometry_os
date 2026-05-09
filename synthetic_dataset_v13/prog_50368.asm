; DESCRIPTION: Places a green line segment connecting (435, 101) to (191, 83).
; PLAN: r0=435(x1), r1=101(y1), r2=191(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 101
LDI r2, 191
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
