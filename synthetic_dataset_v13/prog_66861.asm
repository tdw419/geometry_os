; DESCRIPTION: Draws a black line from (362, 225) to (461, 104).
; PLAN: r0=362(x1), r1=225(y1), r2=461(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 225
LDI r2, 461
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
