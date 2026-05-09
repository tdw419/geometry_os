; DESCRIPTION: Draws a yellow line from (194, 133) to (239, 237).
; PLAN: r0=194(x1), r1=133(y1), r2=239(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 133
LDI r2, 239
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
