; DESCRIPTION: Places a yellow line segment connecting (292, 213) to (155, 182).
; PLAN: r0=292(x1), r1=213(y1), r2=155(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 213
LDI r2, 155
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
