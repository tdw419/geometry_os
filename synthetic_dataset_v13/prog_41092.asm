; DESCRIPTION: Composite: Draws a white circle centered at (413, 166) with radius 10 then Places a black dot at position (470, 107).
; PLAN: r0=413(x), r1=166(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x), r6=107(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 413
LDI r1, 166
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 107
LDI r7, 0x000000
PSET r5, r6, r7
HALT
