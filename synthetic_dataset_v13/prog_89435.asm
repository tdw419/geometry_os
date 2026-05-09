; DESCRIPTION: Renders a magenta line between points (350, 86) and (370, 28).
; PLAN: r0=350(x1), r1=86(y1), r2=370(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 86
LDI r2, 370
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
