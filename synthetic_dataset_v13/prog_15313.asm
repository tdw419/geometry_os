; DESCRIPTION: Composite: Places a purple line segment connecting (299, 166) to (222, 193) then Renders a yellow disk with center (210, 159) and radius 69.
; PLAN: r0=299(x1), r1=166(y1), r2=222(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=159(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 166
LDI r2, 222
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 159
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
