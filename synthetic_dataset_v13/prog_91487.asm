; DESCRIPTION: Draws a red line from (79, 82) to (449, 223).
; PLAN: r0=79(x1), r1=82(y1), r2=449(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 82
LDI r2, 449
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
