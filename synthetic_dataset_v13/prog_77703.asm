; DESCRIPTION: Draws a red line from (382, 178) to (477, 238).
; PLAN: r0=382(x1), r1=178(y1), r2=477(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 178
LDI r2, 477
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
