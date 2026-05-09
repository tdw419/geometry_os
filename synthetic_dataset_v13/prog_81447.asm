; DESCRIPTION: Renders a yellow line between points (216, 102) and (294, 1).
; PLAN: r0=216(x1), r1=102(y1), r2=294(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 102
LDI r2, 294
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
