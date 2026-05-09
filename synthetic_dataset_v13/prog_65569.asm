; DESCRIPTION: Draws a magenta line from (370, 171) to (222, 39).
; PLAN: r0=370(x1), r1=171(y1), r2=222(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 171
LDI r2, 222
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
