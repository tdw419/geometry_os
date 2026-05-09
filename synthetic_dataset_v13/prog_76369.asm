; DESCRIPTION: Renders a magenta line between points (219, 198) and (174, 27).
; PLAN: r0=219(x1), r1=198(y1), r2=174(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 198
LDI r2, 174
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
