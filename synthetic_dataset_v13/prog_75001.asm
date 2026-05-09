; DESCRIPTION: Draws a magenta line from (262, 148) to (24, 220).
; PLAN: r0=262(x1), r1=148(y1), r2=24(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 148
LDI r2, 24
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
