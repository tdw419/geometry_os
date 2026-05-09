; DESCRIPTION: Draws a red line from (426, 93) to (307, 11).
; PLAN: r0=426(x1), r1=93(y1), r2=307(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 93
LDI r2, 307
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
