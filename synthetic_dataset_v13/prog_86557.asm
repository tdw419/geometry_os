; DESCRIPTION: Draws a red line from (460, 24) to (383, 119).
; PLAN: r0=460(x1), r1=24(y1), r2=383(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 24
LDI r2, 383
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
