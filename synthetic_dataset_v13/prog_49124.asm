; DESCRIPTION: Draws a red line from (82, 32) to (41, 207).
; PLAN: r0=82(x1), r1=32(y1), r2=41(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 32
LDI r2, 41
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
