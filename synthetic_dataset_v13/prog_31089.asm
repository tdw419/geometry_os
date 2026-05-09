; DESCRIPTION: Composite: Places a black 58x15 rectangle at position (11, 29) then Renders a orange disk with center (342, 39) and radius 11.
; PLAN: r0=11(x), r1=29(y), r2=58(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=39(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 29
LDI r2, 58
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 39
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
