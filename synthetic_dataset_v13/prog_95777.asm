; DESCRIPTION: Draws a green line from (141, 148) to (44, 241).
; PLAN: r0=141(x1), r1=148(y1), r2=44(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 148
LDI r2, 44
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
