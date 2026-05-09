; DESCRIPTION: Composite: Renders a green disk with center (340, 157) and radius 56 then Renders a magenta line between points (124, 85) and (113, 1).
; PLAN: r0=340(x), r1=157(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x1), r6=85(y1), r7=113(x2), r8=1(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 157
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 85
LDI r7, 113
LDI r8, 1
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
