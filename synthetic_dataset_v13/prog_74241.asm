; DESCRIPTION: Renders a yellow line between points (408, 39) and (325, 226).
; PLAN: r0=408(x1), r1=39(y1), r2=325(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 39
LDI r2, 325
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
