; DESCRIPTION: Draws a purple line from (291, 146) to (59, 73).
; PLAN: r0=291(x1), r1=146(y1), r2=59(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 146
LDI r2, 59
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
