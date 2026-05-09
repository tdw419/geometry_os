; DESCRIPTION: Draws a yellow line from (326, 106) to (30, 203).
; PLAN: r0=326(x1), r1=106(y1), r2=30(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 106
LDI r2, 30
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
