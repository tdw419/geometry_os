; DESCRIPTION: Draws a purple line from (150, 184) to (340, 189).
; PLAN: r0=150(x1), r1=184(y1), r2=340(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 184
LDI r2, 340
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
