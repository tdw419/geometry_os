; DESCRIPTION: Composite: Renders a white box of size 87x40 starting at (99, 55) then Places a white dot at position (494, 10).
; PLAN: r0=99(x), r1=55(y), r2=87(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=10(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 55
LDI r2, 87
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 10
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
