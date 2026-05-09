; DESCRIPTION: Composite: Renders a magenta line between points (435, 28) and (140, 144) then Sets a single yellow pixel at (355, 22).
; PLAN: r0=435(x1), r1=28(y1), r2=140(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=22(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 435
LDI r1, 28
LDI r2, 140
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 22
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
