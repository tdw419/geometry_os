; DESCRIPTION: Renders a blue line between points (408, 240) and (276, 197).
; PLAN: r0=408(x1), r1=240(y1), r2=276(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 240
LDI r2, 276
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
