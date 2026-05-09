; DESCRIPTION: Draws a yellow line from (22, 241) to (220, 103).
; PLAN: r0=22(x1), r1=241(y1), r2=220(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 241
LDI r2, 220
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
