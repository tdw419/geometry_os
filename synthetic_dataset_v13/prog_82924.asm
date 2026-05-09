; DESCRIPTION: Renders a magenta line between points (230, 237) and (178, 9).
; PLAN: r0=230(x1), r1=237(y1), r2=178(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 237
LDI r2, 178
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
