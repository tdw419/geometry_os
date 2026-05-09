; DESCRIPTION: Draws a green line from (477, 170) to (42, 95).
; PLAN: r0=477(x1), r1=170(y1), r2=42(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 170
LDI r2, 42
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
