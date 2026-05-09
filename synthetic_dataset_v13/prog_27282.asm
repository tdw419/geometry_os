; DESCRIPTION: Composite: Renders a white disk with center (166, 176) and radius 76 then Places a white 18x89 rectangle at position (390, 144).
; PLAN: r0=166(x), r1=176(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x), r6=144(y), r7=18(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 176
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 144
LDI r7, 18
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
