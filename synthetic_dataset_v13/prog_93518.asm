; DESCRIPTION: Draws a yellow line from (326, 139) to (138, 127).
; PLAN: r0=326(x1), r1=139(y1), r2=138(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 139
LDI r2, 138
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
