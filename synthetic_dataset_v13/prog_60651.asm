; DESCRIPTION: Draws a blue line from (74, 26) to (324, 16).
; PLAN: r0=74(x1), r1=26(y1), r2=324(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 26
LDI r2, 324
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
