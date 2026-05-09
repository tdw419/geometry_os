; DESCRIPTION: Composite: Renders a magenta box of size 37x89 starting at (91, 41) then Places a blue dot at position (17, 184).
; PLAN: r0=91(x), r1=41(y), r2=37(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=184(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 41
LDI r2, 37
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 184
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
