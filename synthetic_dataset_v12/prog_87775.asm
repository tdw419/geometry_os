; DESCRIPTION: Draws a yellow line from (111, 216) to (182, 103).
; PLAN: r0=111(x1), r1=216(y1), r2=182(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 216
LDI r2, 182
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
