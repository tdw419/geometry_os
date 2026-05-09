; DESCRIPTION: Draws a white line from (462, 167) to (141, 222).
; PLAN: r0=462(x1), r1=167(y1), r2=141(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 167
LDI r2, 141
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
