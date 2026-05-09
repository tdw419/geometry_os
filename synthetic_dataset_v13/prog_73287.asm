; DESCRIPTION: Draws a blue line from (343, 58) to (239, 11).
; PLAN: r0=343(x1), r1=58(y1), r2=239(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 58
LDI r2, 239
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
