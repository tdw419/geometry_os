; DESCRIPTION: Draws a blue line from (30, 16) to (426, 47).
; PLAN: r0=30(x1), r1=16(y1), r2=426(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 16
LDI r2, 426
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
