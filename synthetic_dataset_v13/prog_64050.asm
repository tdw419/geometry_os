; DESCRIPTION: Renders a magenta line between points (123, 14) and (178, 160).
; PLAN: r0=123(x1), r1=14(y1), r2=178(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 14
LDI r2, 178
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
