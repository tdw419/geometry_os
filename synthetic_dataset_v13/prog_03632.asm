; DESCRIPTION: Draws a white line from (434, 159) to (467, 149).
; PLAN: r0=434(x1), r1=159(y1), r2=467(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 159
LDI r2, 467
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
