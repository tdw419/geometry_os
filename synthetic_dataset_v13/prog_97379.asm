; DESCRIPTION: Renders a yellow line between points (442, 154) and (395, 72).
; PLAN: r0=442(x1), r1=154(y1), r2=395(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 154
LDI r2, 395
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
