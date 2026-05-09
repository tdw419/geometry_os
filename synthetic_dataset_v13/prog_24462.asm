; DESCRIPTION: Renders a magenta line between points (69, 99) and (91, 234).
; PLAN: r0=69(x1), r1=99(y1), r2=91(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 99
LDI r2, 91
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
