; DESCRIPTION: Draws a white line from (429, 38) to (184, 19).
; PLAN: r0=429(x1), r1=38(y1), r2=184(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 38
LDI r2, 184
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
