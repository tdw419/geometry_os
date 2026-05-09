; DESCRIPTION: Draws a yellow line from (493, 91) to (326, 204).
; PLAN: r0=493(x1), r1=91(y1), r2=326(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 91
LDI r2, 326
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
