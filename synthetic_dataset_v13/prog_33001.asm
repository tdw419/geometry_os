; DESCRIPTION: Draws a magenta line from (280, 151) to (69, 159).
; PLAN: r0=280(x1), r1=151(y1), r2=69(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 151
LDI r2, 69
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
