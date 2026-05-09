; DESCRIPTION: Draws a purple line from (239, 171) to (24, 76).
; PLAN: r0=239(x1), r1=171(y1), r2=24(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 171
LDI r2, 24
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
