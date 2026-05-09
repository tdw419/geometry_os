; DESCRIPTION: Draws a orange line from (228, 144) to (497, 173).
; PLAN: r0=228(x1), r1=144(y1), r2=497(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 144
LDI r2, 497
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
