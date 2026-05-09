; DESCRIPTION: Composite: Renders a magenta line between points (68, 95) and (35, 110) then Renders a orange disk with center (216, 58) and radius 27.
; PLAN: r0=68(x1), r1=95(y1), r2=35(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=58(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 95
LDI r2, 35
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 58
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
