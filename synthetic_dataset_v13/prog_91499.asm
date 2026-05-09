; DESCRIPTION: Draws a magenta line from (161, 209) to (318, 36).
; PLAN: r0=161(x1), r1=209(y1), r2=318(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 209
LDI r2, 318
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
