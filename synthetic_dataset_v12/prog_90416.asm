; DESCRIPTION: Draws a black line from (429, 50) to (82, 199).
; PLAN: r0=429(x1), r1=50(y1), r2=82(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 50
LDI r2, 82
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
