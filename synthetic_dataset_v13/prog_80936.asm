; DESCRIPTION: Draws a magenta line from (164, 164) to (37, 93).
; PLAN: r0=164(x1), r1=164(y1), r2=37(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 164
LDI r2, 37
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
