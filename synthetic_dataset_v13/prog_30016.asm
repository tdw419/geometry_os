; DESCRIPTION: Composite: Renders a magenta line between points (454, 140) and (42, 244) then Creates a yellow circular shape at (442, 29) with radius 29.
; PLAN: r0=454(x1), r1=140(y1), r2=42(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=29(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 140
LDI r2, 42
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 29
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
