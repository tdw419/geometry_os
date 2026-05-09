; DESCRIPTION: Composite: Places a purple dot at position (448, 251) then Renders a white box of size 20x85 starting at (413, 31) then Places a yellow circle of radius 72 at center (151, 120).
; PLAN: r0=448(x), r1=251(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=31(y), r7=20(width), r8=85(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=151(x), r11=120(y), r12=72(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 251
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 31
LDI r7, 20
LDI r8, 85
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 120
LDI r12, 72
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
