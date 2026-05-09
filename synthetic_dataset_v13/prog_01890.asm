; DESCRIPTION: Renders a magenta line between points (144, 234) and (475, 123).
; PLAN: r0=144(x1), r1=234(y1), r2=475(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 234
LDI r2, 475
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
