; DESCRIPTION: Renders a orange line between points (494, 22) and (242, 15).
; PLAN: r0=494(x1), r1=22(y1), r2=242(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 22
LDI r2, 242
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
