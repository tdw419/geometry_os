; DESCRIPTION: Draws a red line from (429, 150) to (260, 202).
; PLAN: r0=429(x1), r1=150(y1), r2=260(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 150
LDI r2, 260
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
