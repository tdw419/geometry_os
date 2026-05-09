; DESCRIPTION: Draws a magenta line from (421, 128) to (477, 150).
; PLAN: r0=421(x1), r1=128(y1), r2=477(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 128
LDI r2, 477
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
