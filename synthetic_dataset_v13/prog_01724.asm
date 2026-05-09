; DESCRIPTION: Draws a red line from (247, 93) to (461, 223).
; PLAN: r0=247(x1), r1=93(y1), r2=461(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 93
LDI r2, 461
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
