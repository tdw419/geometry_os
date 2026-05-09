; DESCRIPTION: Draws a yellow line from (411, 83) to (203, 57).
; PLAN: r0=411(x1), r1=83(y1), r2=203(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 83
LDI r2, 203
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
