; DESCRIPTION: Composite: Renders a purple line between points (468, 10) and (7, 152) then Renders a white disk with center (243, 201) and radius 10.
; PLAN: r0=468(x1), r1=10(y1), r2=7(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=201(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 10
LDI r2, 7
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 201
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
