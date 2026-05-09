; DESCRIPTION: Draws a green line from (151, 143) to (185, 230).
; PLAN: r0=151(x1), r1=143(y1), r2=185(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 143
LDI r2, 185
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
