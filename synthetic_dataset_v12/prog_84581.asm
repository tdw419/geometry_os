; DESCRIPTION: Draws a magenta line from (455, 165) to (52, 48).
; PLAN: r0=455(x1), r1=165(y1), r2=52(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 165
LDI r2, 52
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
