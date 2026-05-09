; DESCRIPTION: Draws a purple line from (113, 43) to (460, 6).
; PLAN: r0=113(x1), r1=43(y1), r2=460(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 43
LDI r2, 460
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
