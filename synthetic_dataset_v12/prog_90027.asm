; DESCRIPTION: Draws a orange line from (221, 149) to (111, 20).
; PLAN: r0=221(x1), r1=149(y1), r2=111(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 149
LDI r2, 111
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
