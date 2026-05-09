; DESCRIPTION: Composite: Renders a magenta disk with center (255, 199) and radius 26 then Places a white line segment connecting (18, 134) to (256, 6).
; PLAN: r0=255(x), r1=199(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x1), r6=134(y1), r7=256(x2), r8=6(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 199
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 134
LDI r7, 256
LDI r8, 6
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
