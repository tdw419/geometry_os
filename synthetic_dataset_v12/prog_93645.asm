; DESCRIPTION: Renders a magenta line between points (480, 23) and (406, 147).
; PLAN: r0=480(x1), r1=23(y1), r2=406(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 23
LDI r2, 406
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
