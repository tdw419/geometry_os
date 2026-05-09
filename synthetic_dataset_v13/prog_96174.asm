; DESCRIPTION: Draws a red line from (443, 176) to (429, 83).
; PLAN: r0=443(x1), r1=176(y1), r2=429(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 176
LDI r2, 429
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
