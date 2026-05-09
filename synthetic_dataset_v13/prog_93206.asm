; DESCRIPTION: Draws a magenta line from (250, 243) to (182, 178).
; PLAN: r0=250(x1), r1=243(y1), r2=182(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 243
LDI r2, 182
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
