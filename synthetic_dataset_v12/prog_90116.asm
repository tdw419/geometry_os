; DESCRIPTION: Draws a red line from (496, 127) to (429, 209).
; PLAN: r0=496(x1), r1=127(y1), r2=429(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 127
LDI r2, 429
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
