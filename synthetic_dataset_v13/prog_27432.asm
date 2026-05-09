; DESCRIPTION: Draws a green line from (107, 43) to (111, 34).
; PLAN: r0=107(x1), r1=43(y1), r2=111(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 43
LDI r2, 111
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
