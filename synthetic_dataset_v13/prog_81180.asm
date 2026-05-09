; DESCRIPTION: Composite: Places a purple circle of radius 78 at center (199, 148) then Renders a green box of size 115x45 starting at (127, 10).
; PLAN: r0=199(x), r1=148(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=10(y), r7=115(width), r8=45(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 148
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 10
LDI r7, 115
LDI r8, 45
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
