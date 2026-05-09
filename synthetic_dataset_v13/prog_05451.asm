; DESCRIPTION: Draws a green line from (105, 203) to (151, 254).
; PLAN: r0=105(x1), r1=203(y1), r2=151(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 203
LDI r2, 151
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
