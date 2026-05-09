; DESCRIPTION: Draws a blue line from (74, 76) to (265, 43).
; PLAN: r0=74(x1), r1=76(y1), r2=265(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 76
LDI r2, 265
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
