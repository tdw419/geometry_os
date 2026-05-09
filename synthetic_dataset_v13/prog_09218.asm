; DESCRIPTION: Draws a magenta line from (500, 251) to (438, 113).
; PLAN: r0=500(x1), r1=251(y1), r2=438(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 251
LDI r2, 438
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
