; DESCRIPTION: Composite: Renders a yellow box of size 42x41 starting at (281, 126) then Places a yellow dot at position (11, 4).
; PLAN: r0=281(x), r1=126(y), r2=42(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x), r6=4(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 126
LDI r2, 42
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 4
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
