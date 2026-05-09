; DESCRIPTION: Draws a green line from (411, 104) to (3, 165).
; PLAN: r0=411(x1), r1=104(y1), r2=3(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 104
LDI r2, 3
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
