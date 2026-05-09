; DESCRIPTION: Composite: Creates a yellow circular shape at (377, 152) with radius 56 then Renders a magenta line between points (321, 210) and (86, 201).
; PLAN: r0=377(x), r1=152(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=210(y1), r7=86(x2), r8=201(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 152
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 210
LDI r7, 86
LDI r8, 201
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
