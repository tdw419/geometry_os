; DESCRIPTION: Draws a green line from (191, 202) to (53, 118).
; PLAN: r0=191(x1), r1=202(y1), r2=53(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 202
LDI r2, 53
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
