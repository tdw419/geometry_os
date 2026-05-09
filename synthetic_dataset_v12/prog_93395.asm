; DESCRIPTION: Draws a green line from (14, 134) to (368, 121).
; PLAN: r0=14(x1), r1=134(y1), r2=368(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 134
LDI r2, 368
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
