; DESCRIPTION: Renders a magenta line between points (238, 128) and (430, 11).
; PLAN: r0=238(x1), r1=128(y1), r2=430(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 128
LDI r2, 430
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
