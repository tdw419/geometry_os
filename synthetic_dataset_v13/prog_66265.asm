; DESCRIPTION: Draws a yellow line from (411, 151) to (388, 48).
; PLAN: r0=411(x1), r1=151(y1), r2=388(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 151
LDI r2, 388
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
