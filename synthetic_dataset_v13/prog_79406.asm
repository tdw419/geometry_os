; DESCRIPTION: Composite: Renders a white line between points (256, 98) and (37, 106) then Places a purple circle of radius 45 at center (234, 116).
; PLAN: r0=256(x1), r1=98(y1), r2=37(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=116(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 256
LDI r1, 98
LDI r2, 37
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 116
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
