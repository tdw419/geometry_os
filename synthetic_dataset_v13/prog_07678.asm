; DESCRIPTION: Renders a yellow line between points (504, 245) and (243, 100).
; PLAN: r0=504(x1), r1=245(y1), r2=243(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 245
LDI r2, 243
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
