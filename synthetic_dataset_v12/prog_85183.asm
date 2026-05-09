; DESCRIPTION: Places a yellow line segment connecting (209, 73) to (14, 52).
; PLAN: r0=209(x1), r1=73(y1), r2=14(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 73
LDI r2, 14
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
