; DESCRIPTION: Draws a magenta line from (184, 116) to (342, 18).
; PLAN: r0=184(x1), r1=116(y1), r2=342(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 116
LDI r2, 342
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
