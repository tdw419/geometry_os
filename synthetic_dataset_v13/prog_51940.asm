; DESCRIPTION: Draws a red line from (28, 224) to (429, 34).
; PLAN: r0=28(x1), r1=224(y1), r2=429(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 224
LDI r2, 429
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
