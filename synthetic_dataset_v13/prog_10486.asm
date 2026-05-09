; DESCRIPTION: Composite: Renders a red box of size 112x85 starting at (11, 137) then Places a black dot at position (327, 156).
; PLAN: r0=11(x), r1=137(y), r2=112(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=156(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 137
LDI r2, 112
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 156
LDI r7, 0x000000
PSET r5, r6, r7
HALT
