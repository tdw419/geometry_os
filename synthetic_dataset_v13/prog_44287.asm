; DESCRIPTION: Draws a yellow line from (134, 76) to (269, 20).
; PLAN: r0=134(x1), r1=76(y1), r2=269(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 76
LDI r2, 269
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
