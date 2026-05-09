; DESCRIPTION: Draws a purple line from (105, 29) to (239, 75).
; PLAN: r0=105(x1), r1=29(y1), r2=239(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 29
LDI r2, 239
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
