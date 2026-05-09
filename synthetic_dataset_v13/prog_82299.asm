; DESCRIPTION: Draws a red line from (256, 221) to (151, 230).
; PLAN: r0=256(x1), r1=221(y1), r2=151(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 221
LDI r2, 151
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
