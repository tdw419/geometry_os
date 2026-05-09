; DESCRIPTION: Draws a magenta line from (276, 186) to (240, 158).
; PLAN: r0=276(x1), r1=186(y1), r2=240(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 186
LDI r2, 240
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
