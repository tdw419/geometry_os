; DESCRIPTION: Draws a blue line from (141, 165) to (268, 173).
; PLAN: r0=141(x1), r1=165(y1), r2=268(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 165
LDI r2, 268
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
