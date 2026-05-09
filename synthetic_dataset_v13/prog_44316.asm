; DESCRIPTION: Draws a cyan line from (166, 110) to (429, 116).
; PLAN: r0=166(x1), r1=110(y1), r2=429(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 110
LDI r2, 429
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
