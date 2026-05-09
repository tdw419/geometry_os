; DESCRIPTION: Draws a white line from (291, 225) to (101, 188).
; PLAN: r0=291(x1), r1=225(y1), r2=101(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 225
LDI r2, 101
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
