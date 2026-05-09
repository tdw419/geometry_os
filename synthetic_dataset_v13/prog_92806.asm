; DESCRIPTION: Draws a magenta line from (292, 86) to (35, 239).
; PLAN: r0=292(x1), r1=86(y1), r2=35(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 86
LDI r2, 35
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
