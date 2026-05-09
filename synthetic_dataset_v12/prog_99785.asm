; DESCRIPTION: Draws a magenta line from (376, 27) to (184, 232).
; PLAN: r0=376(x1), r1=27(y1), r2=184(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 27
LDI r2, 184
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
