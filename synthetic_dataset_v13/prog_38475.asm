; DESCRIPTION: Draws a white line from (396, 125) to (212, 190).
; PLAN: r0=396(x1), r1=125(y1), r2=212(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 125
LDI r2, 212
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
