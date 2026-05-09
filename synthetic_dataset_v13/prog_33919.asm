; DESCRIPTION: Draws a red line from (231, 71) to (276, 238).
; PLAN: r0=231(x1), r1=71(y1), r2=276(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 71
LDI r2, 276
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
