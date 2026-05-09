; DESCRIPTION: Draws a red line from (53, 80) to (345, 57).
; PLAN: r0=53(x1), r1=80(y1), r2=345(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 80
LDI r2, 345
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
