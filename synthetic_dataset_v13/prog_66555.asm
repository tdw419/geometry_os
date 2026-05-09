; DESCRIPTION: Draws a magenta line from (271, 17) to (207, 44).
; PLAN: r0=271(x1), r1=17(y1), r2=207(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 17
LDI r2, 207
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
