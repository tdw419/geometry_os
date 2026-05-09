; DESCRIPTION: Draws a yellow line from (94, 111) to (222, 135).
; PLAN: r0=94(x1), r1=111(y1), r2=222(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 111
LDI r2, 222
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
