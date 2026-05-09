; DESCRIPTION: Places a yellow line segment connecting (202, 96) to (182, 3).
; PLAN: r0=202(x1), r1=96(y1), r2=182(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 96
LDI r2, 182
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
