; DESCRIPTION: Draws a green line from (233, 0) to (19, 22).
; PLAN: r0=233(x1), r1=0(y1), r2=19(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 0
LDI r2, 19
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
