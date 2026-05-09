; DESCRIPTION: Draws a magenta line from (239, 140) to (148, 65).
; PLAN: r0=239(x1), r1=140(y1), r2=148(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 140
LDI r2, 148
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
