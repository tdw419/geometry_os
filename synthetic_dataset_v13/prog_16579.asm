; DESCRIPTION: Draws a purple line from (65, 52) to (239, 202).
; PLAN: r0=65(x1), r1=52(y1), r2=239(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 52
LDI r2, 239
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
