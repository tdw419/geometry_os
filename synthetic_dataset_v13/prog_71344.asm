; DESCRIPTION: Draws a yellow line from (146, 157) to (8, 217).
; PLAN: r0=146(x1), r1=157(y1), r2=8(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 157
LDI r2, 8
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
