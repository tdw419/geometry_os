; DESCRIPTION: Draws a red line from (58, 136) to (435, 239).
; PLAN: r0=58(x1), r1=136(y1), r2=435(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 136
LDI r2, 435
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
