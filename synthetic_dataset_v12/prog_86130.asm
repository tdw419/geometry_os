; DESCRIPTION: Composite: Renders a magenta line between points (155, 165) and (330, 144) then Places a yellow circle of radius 72 at center (72, 82).
; PLAN: r0=155(x1), r1=165(y1), r2=330(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=82(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 155
LDI r1, 165
LDI r2, 330
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 82
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
