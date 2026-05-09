; DESCRIPTION: Renders a magenta line between points (17, 63) and (235, 39).
; PLAN: r0=17(x1), r1=63(y1), r2=235(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 63
LDI r2, 235
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
