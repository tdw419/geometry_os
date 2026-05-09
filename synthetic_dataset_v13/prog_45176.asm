; DESCRIPTION: Draws a red line from (401, 157) to (497, 254).
; PLAN: r0=401(x1), r1=157(y1), r2=497(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 157
LDI r2, 497
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
