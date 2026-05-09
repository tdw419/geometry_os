; DESCRIPTION: Draws a white line from (51, 32) to (341, 198).
; PLAN: r0=51(x1), r1=32(y1), r2=341(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 32
LDI r2, 341
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
