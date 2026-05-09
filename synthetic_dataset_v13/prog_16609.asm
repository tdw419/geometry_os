; DESCRIPTION: Renders a blue line between points (64, 205) and (56, 1).
; PLAN: r0=64(x1), r1=205(y1), r2=56(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 205
LDI r2, 56
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
