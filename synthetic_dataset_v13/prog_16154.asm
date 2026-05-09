; DESCRIPTION: Draws a yellow line from (211, 76) to (307, 25).
; PLAN: r0=211(x1), r1=76(y1), r2=307(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 76
LDI r2, 307
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
