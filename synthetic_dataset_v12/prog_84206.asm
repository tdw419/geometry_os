; DESCRIPTION: Composite: Renders a purple disk with center (106, 170) and radius 11 then Places a black 110x38 rectangle at position (9, 7).
; PLAN: r0=106(x), r1=170(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=7(y), r7=110(width), r8=38(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 170
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 7
LDI r7, 110
LDI r8, 38
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
