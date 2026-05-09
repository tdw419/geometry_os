; DESCRIPTION: Composite: Renders a blue line between points (280, 251) and (496, 190) then Creates a white rectangular region at (19, 49) spanning 30 by 111 pixels.
; PLAN: r0=280(x1), r1=251(y1), r2=496(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=49(y), r7=30(width), r8=111(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 251
LDI r2, 496
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 49
LDI r7, 30
LDI r8, 111
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
