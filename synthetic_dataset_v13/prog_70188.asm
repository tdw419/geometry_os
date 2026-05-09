; DESCRIPTION: Composite: Renders a white box of size 12x43 starting at (51, 11) then Places a orange dot at position (288, 83).
; PLAN: r0=51(x), r1=11(y), r2=12(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=83(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 51
LDI r1, 11
LDI r2, 12
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 83
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
