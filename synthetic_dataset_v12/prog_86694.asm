; DESCRIPTION: Draws a magenta line from (473, 154) to (347, 74).
; PLAN: r0=473(x1), r1=154(y1), r2=347(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 154
LDI r2, 347
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
