; DESCRIPTION: Composite: Places a orange dot at position (319, 220) then Renders a black disk with center (128, 166) and radius 15.
; PLAN: r0=319(x), r1=220(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=128(x), r6=166(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 220
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 128
LDI r6, 166
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
