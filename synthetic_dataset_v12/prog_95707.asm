; DESCRIPTION: Places a black line segment connecting (290, 192) to (81, 117).
; PLAN: r0=290(x1), r1=192(y1), r2=81(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 192
LDI r2, 81
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
