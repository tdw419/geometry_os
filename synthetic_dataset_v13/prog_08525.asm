; DESCRIPTION: Renders a yellow line between points (167, 212) and (361, 64).
; PLAN: r0=167(x1), r1=212(y1), r2=361(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 212
LDI r2, 361
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
