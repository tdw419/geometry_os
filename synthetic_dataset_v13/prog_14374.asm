; DESCRIPTION: Renders a yellow line between points (70, 234) and (1, 84).
; PLAN: r0=70(x1), r1=234(y1), r2=1(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 234
LDI r2, 1
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
