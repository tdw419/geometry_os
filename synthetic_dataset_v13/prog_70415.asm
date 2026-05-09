; DESCRIPTION: Draws a magenta line from (14, 177) to (455, 120).
; PLAN: r0=14(x1), r1=177(y1), r2=455(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 177
LDI r2, 455
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
