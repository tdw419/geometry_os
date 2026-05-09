; DESCRIPTION: Renders a magenta line between points (224, 114) and (472, 33).
; PLAN: r0=224(x1), r1=114(y1), r2=472(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 114
LDI r2, 472
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
