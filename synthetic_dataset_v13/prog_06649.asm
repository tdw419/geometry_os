; DESCRIPTION: Composite: Renders a green box of size 56x89 starting at (63, 48) then Places a red circle of radius 31 at center (258, 130).
; PLAN: r0=63(x), r1=48(y), r2=56(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=130(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 48
LDI r2, 56
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 130
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
