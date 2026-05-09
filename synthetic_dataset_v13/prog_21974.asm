; DESCRIPTION: Draws a yellow line from (358, 203) to (220, 55).
; PLAN: r0=358(x1), r1=203(y1), r2=220(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 203
LDI r2, 220
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
