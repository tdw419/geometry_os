; DESCRIPTION: Composite: Renders a black box of size 56x45 starting at (184, 174) then Sets a single black pixel at (275, 253).
; PLAN: r0=184(x), r1=174(y), r2=56(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=253(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 174
LDI r2, 56
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 253
LDI r7, 0x000000
PSET r5, r6, r7
HALT
