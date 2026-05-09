; DESCRIPTION: Draws a green line from (15, 122) to (338, 188).
; PLAN: r0=15(x1), r1=122(y1), r2=338(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 122
LDI r2, 338
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
