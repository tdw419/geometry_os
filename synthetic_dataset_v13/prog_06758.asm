; DESCRIPTION: Draws a purple line from (54, 171) to (239, 0).
; PLAN: r0=54(x1), r1=171(y1), r2=239(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 171
LDI r2, 239
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
