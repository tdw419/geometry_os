; DESCRIPTION: Composite: Renders a white box of size 45x32 starting at (9, 165) then Sets a single black pixel at (372, 1).
; PLAN: r0=9(x), r1=165(y), r2=45(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=1(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 9
LDI r1, 165
LDI r2, 45
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 1
LDI r7, 0x000000
PSET r5, r6, r7
HALT
