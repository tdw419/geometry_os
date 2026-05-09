; DESCRIPTION: Renders a magenta line between points (174, 15) and (285, 175).
; PLAN: r0=174(x1), r1=15(y1), r2=285(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 15
LDI r2, 285
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
