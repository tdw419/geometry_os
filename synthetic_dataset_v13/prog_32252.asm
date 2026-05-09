; DESCRIPTION: Renders a yellow line between points (340, 106) and (493, 65).
; PLAN: r0=340(x1), r1=106(y1), r2=493(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 106
LDI r2, 493
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
