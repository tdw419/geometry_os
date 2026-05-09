; DESCRIPTION: Draws a yellow line from (137, 213) to (50, 96).
; PLAN: r0=137(x1), r1=213(y1), r2=50(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 213
LDI r2, 50
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
