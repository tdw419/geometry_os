; DESCRIPTION: Draws a black line from (151, 24) to (74, 162).
; PLAN: r0=151(x1), r1=24(y1), r2=74(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 24
LDI r2, 74
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
