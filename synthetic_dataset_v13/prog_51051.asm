; DESCRIPTION: Places a yellow line segment connecting (202, 12) to (19, 159).
; PLAN: r0=202(x1), r1=12(y1), r2=19(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 12
LDI r2, 19
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
