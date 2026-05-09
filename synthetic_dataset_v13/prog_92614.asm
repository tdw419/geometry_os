; DESCRIPTION: Draws a magenta line from (233, 28) to (74, 93).
; PLAN: r0=233(x1), r1=28(y1), r2=74(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 28
LDI r2, 74
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
