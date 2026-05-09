; DESCRIPTION: Draws a yellow line from (333, 221) to (119, 112).
; PLAN: r0=333(x1), r1=221(y1), r2=119(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 221
LDI r2, 119
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
