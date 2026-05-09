; DESCRIPTION: Composite: Places a white circle of radius 40 at center (427, 216) then Renders a green box of size 91x40 starting at (414, 6).
; PLAN: r0=427(x), r1=216(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=6(y), r7=91(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 216
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 6
LDI r7, 91
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
