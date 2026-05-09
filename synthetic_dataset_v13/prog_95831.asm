; DESCRIPTION: Draws a yellow line from (474, 74) to (310, 26).
; PLAN: r0=474(x1), r1=74(y1), r2=310(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 74
LDI r2, 310
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
