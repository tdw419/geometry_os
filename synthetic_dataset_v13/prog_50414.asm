; DESCRIPTION: Draws a yellow line from (159, 210) to (368, 139).
; PLAN: r0=159(x1), r1=210(y1), r2=368(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 210
LDI r2, 368
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
