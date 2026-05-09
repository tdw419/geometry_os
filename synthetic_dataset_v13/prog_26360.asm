; DESCRIPTION: Draws a orange line from (31, 111) to (126, 125).
; PLAN: r0=31(x1), r1=111(y1), r2=126(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 111
LDI r2, 126
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
