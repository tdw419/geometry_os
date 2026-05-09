; DESCRIPTION: Draws a magenta line from (261, 154) to (292, 51).
; PLAN: r0=261(x1), r1=154(y1), r2=292(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 154
LDI r2, 292
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
