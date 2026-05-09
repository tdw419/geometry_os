; DESCRIPTION: Draws a yellow line from (499, 94) to (119, 61).
; PLAN: r0=499(x1), r1=94(y1), r2=119(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 94
LDI r2, 119
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
