; DESCRIPTION: Draws a magenta line from (329, 62) to (292, 230).
; PLAN: r0=329(x1), r1=62(y1), r2=292(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 62
LDI r2, 292
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
