; DESCRIPTION: Draws a red line from (382, 82) to (23, 28).
; PLAN: r0=382(x1), r1=82(y1), r2=23(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 82
LDI r2, 23
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
