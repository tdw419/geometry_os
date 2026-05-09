; DESCRIPTION: Draws a magenta line from (510, 243) to (303, 156).
; PLAN: r0=510(x1), r1=243(y1), r2=303(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 243
LDI r2, 303
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
