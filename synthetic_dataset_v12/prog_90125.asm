; DESCRIPTION: Composite: Renders a green box of size 112x105 starting at (373, 142) then Places a black line segment connecting (376, 157) to (211, 77).
; PLAN: r0=373(x), r1=142(y), r2=112(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x1), r6=157(y1), r7=211(x2), r8=77(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 142
LDI r2, 112
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 157
LDI r7, 211
LDI r8, 77
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
