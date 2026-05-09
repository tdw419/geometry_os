; DESCRIPTION: Composite: Draws a magenta line from (357, 11) to (449, 129) then Renders a magenta disk with center (185, 196) and radius 57.
; PLAN: r0=357(x1), r1=11(y1), r2=449(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=196(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 11
LDI r2, 449
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 196
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
