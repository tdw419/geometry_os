; DESCRIPTION: Draws a green line from (356, 165) to (396, 118).
; PLAN: r0=356(x1), r1=165(y1), r2=396(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 165
LDI r2, 396
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
