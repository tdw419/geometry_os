; DESCRIPTION: Composite: Renders a yellow box of size 37x35 starting at (52, 76) then Places a white dot at position (418, 173).
; PLAN: r0=52(x), r1=76(y), r2=37(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=173(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 52
LDI r1, 76
LDI r2, 37
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 173
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
