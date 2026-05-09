; DESCRIPTION: Draws a magenta line from (490, 28) to (184, 38).
; PLAN: r0=490(x1), r1=28(y1), r2=184(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 28
LDI r2, 184
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
