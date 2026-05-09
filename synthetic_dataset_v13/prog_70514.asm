; DESCRIPTION: Draws a yellow line from (339, 37) to (299, 135).
; PLAN: r0=339(x1), r1=37(y1), r2=299(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 37
LDI r2, 299
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
