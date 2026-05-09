; DESCRIPTION: Renders a yellow line between points (34, 45) and (242, 15).
; PLAN: r0=34(x1), r1=45(y1), r2=242(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 45
LDI r2, 242
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
