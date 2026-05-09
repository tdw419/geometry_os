; DESCRIPTION: Draws a yellow line from (329, 176) to (158, 0).
; PLAN: r0=329(x1), r1=176(y1), r2=158(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 176
LDI r2, 158
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
