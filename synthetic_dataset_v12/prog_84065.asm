; DESCRIPTION: Composite: Draws a black circle centered at (460, 146) with radius 22 then Places a black dot at position (328, 226).
; PLAN: r0=460(x), r1=146(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=226(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 460
LDI r1, 146
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 226
LDI r7, 0x000000
PSET r5, r6, r7
HALT
