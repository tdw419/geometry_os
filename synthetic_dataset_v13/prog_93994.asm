; DESCRIPTION: Draws a magenta line from (302, 39) to (409, 75).
; PLAN: r0=302(x1), r1=39(y1), r2=409(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 39
LDI r2, 409
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
