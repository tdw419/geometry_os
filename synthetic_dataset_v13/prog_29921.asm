; DESCRIPTION: Composite: Creates a magenta circular shape at (125, 91) with radius 47 then Renders a green line between points (301, 199) and (274, 20).
; PLAN: r0=125(x), r1=91(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=199(y1), r7=274(x2), r8=20(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 91
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 199
LDI r7, 274
LDI r8, 20
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
