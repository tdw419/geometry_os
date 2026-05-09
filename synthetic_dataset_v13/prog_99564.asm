; DESCRIPTION: Composite: Renders a yellow disk with center (390, 93) and radius 63 then Places a yellow line segment connecting (212, 164) to (32, 181).
; PLAN: r0=390(x), r1=93(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x1), r6=164(y1), r7=32(x2), r8=181(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 93
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 164
LDI r7, 32
LDI r8, 181
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
