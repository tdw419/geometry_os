; DESCRIPTION: Draws a green line from (70, 251) to (385, 203).
; PLAN: r0=70(x1), r1=251(y1), r2=385(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 251
LDI r2, 385
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
