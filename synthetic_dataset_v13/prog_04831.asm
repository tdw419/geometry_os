; DESCRIPTION: Draws a black line from (167, 225) to (429, 31).
; PLAN: r0=167(x1), r1=225(y1), r2=429(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 225
LDI r2, 429
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
