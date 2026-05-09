; DESCRIPTION: Composite: Draws a green circle centered at (192, 45) with radius 42 then Renders a green box of size 110x112 starting at (47, 13).
; PLAN: r0=192(x), r1=45(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=13(y), r7=110(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 45
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 13
LDI r7, 110
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
