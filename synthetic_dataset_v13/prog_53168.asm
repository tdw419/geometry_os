; DESCRIPTION: Composite: Places a purple line segment connecting (96, 52) to (294, 34) then Renders a purple disk with center (177, 194) and radius 13 then Places a purple dot at position (290, 142).
; PLAN: r0=96(x1), r1=52(y1), r2=294(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=194(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x), r11=142(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 52
LDI r2, 294
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 194
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 142
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
