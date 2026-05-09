; DESCRIPTION: Draws a orange line from (42, 177) to (326, 4).
; PLAN: r0=42(x1), r1=177(y1), r2=326(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 177
LDI r2, 326
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
