; DESCRIPTION: Places a yellow line segment connecting (106, 49) to (214, 27).
; PLAN: r0=106(x1), r1=49(y1), r2=214(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 49
LDI r2, 214
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
