; DESCRIPTION: Renders a magenta line between points (41, 254) and (324, 128).
; PLAN: r0=41(x1), r1=254(y1), r2=324(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 254
LDI r2, 324
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
