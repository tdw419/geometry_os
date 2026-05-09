; DESCRIPTION: Draws a magenta line from (52, 75) to (64, 73).
; PLAN: r0=52(x1), r1=75(y1), r2=64(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 75
LDI r2, 64
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
