; DESCRIPTION: Draws a magenta line from (232, 166) to (120, 134).
; PLAN: r0=232(x1), r1=166(y1), r2=120(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 166
LDI r2, 120
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
