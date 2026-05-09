; DESCRIPTION: Draws a blue line from (81, 126) to (96, 49).
; PLAN: r0=81(x1), r1=126(y1), r2=96(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 126
LDI r2, 96
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
