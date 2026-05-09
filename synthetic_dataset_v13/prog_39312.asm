; DESCRIPTION: Draws a green line from (21, 140) to (273, 114).
; PLAN: r0=21(x1), r1=140(y1), r2=273(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 140
LDI r2, 273
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
