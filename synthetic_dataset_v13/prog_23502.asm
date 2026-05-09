; DESCRIPTION: Draws a magenta line from (57, 249) to (274, 74).
; PLAN: r0=57(x1), r1=249(y1), r2=274(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 249
LDI r2, 274
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
