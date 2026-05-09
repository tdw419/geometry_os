; DESCRIPTION: Composite: Places a blue circle of radius 63 at center (150, 78) then Renders a magenta line between points (322, 66) and (151, 223).
; PLAN: r0=150(x), r1=78(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=66(y1), r7=151(x2), r8=223(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 78
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 66
LDI r7, 151
LDI r8, 223
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
