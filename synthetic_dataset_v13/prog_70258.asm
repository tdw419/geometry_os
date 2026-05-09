; DESCRIPTION: Composite: Renders a red disk with center (183, 136) and radius 39 then Places a magenta line segment connecting (300, 144) to (456, 112).
; PLAN: r0=183(x), r1=136(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=144(y1), r7=456(x2), r8=112(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 136
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 144
LDI r7, 456
LDI r8, 112
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
