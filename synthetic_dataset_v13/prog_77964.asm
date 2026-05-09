; DESCRIPTION: Draws a orange line from (297, 45) to (182, 42).
; PLAN: r0=297(x1), r1=45(y1), r2=182(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 45
LDI r2, 182
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
