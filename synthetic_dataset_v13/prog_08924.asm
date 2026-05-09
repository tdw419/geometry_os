; DESCRIPTION: Draws a orange line from (167, 157) to (199, 143).
; PLAN: r0=167(x1), r1=157(y1), r2=199(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 157
LDI r2, 199
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
