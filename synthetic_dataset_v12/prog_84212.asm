; DESCRIPTION: Renders a orange line between points (48, 112) and (242, 130).
; PLAN: r0=48(x1), r1=112(y1), r2=242(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 112
LDI r2, 242
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
