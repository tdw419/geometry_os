; DESCRIPTION: Places a yellow line segment connecting (2, 77) to (243, 246).
; PLAN: r0=2(x1), r1=77(y1), r2=243(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 77
LDI r2, 243
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
