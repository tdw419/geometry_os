; DESCRIPTION: Renders a magenta line between points (178, 21) and (174, 9).
; PLAN: r0=178(x1), r1=21(y1), r2=174(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 21
LDI r2, 174
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
