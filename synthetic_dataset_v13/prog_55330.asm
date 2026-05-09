; DESCRIPTION: Renders a yellow line between points (13, 242) and (488, 145).
; PLAN: r0=13(x1), r1=242(y1), r2=488(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 242
LDI r2, 488
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
