; DESCRIPTION: Draws a magenta line from (215, 75) to (347, 101).
; PLAN: r0=215(x1), r1=75(y1), r2=347(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 75
LDI r2, 347
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
