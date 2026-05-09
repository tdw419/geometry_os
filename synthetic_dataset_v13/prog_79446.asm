; DESCRIPTION: Draws a orange line from (220, 74) to (414, 173).
; PLAN: r0=220(x1), r1=74(y1), r2=414(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 74
LDI r2, 414
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
