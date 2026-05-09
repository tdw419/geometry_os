; DESCRIPTION: Draws a red line from (122, 49) to (269, 239).
; PLAN: r0=122(x1), r1=49(y1), r2=269(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 49
LDI r2, 269
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
