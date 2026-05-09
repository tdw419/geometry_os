; DESCRIPTION: Composite: Renders a green box of size 58x74 starting at (85, 174) then Places a blue dot at position (418, 125).
; PLAN: r0=85(x), r1=174(y), r2=58(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=125(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 174
LDI r2, 58
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 125
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
