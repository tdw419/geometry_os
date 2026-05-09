; DESCRIPTION: Draws a yellow line from (141, 135) to (252, 77).
; PLAN: r0=141(x1), r1=135(y1), r2=252(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 135
LDI r2, 252
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
