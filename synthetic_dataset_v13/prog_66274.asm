; DESCRIPTION: Draws a yellow line from (21, 98) to (162, 188).
; PLAN: r0=21(x1), r1=98(y1), r2=162(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 98
LDI r2, 162
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
