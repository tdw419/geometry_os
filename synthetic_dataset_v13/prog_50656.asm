; DESCRIPTION: Renders a yellow line between points (18, 251) and (362, 246).
; PLAN: r0=18(x1), r1=251(y1), r2=362(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 251
LDI r2, 362
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
