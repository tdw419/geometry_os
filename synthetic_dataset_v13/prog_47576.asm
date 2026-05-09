; DESCRIPTION: Composite: Draws a yellow circle centered at (117, 50) with radius 33 then Places a black dot at position (255, 20).
; PLAN: r0=117(x), r1=50(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=20(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 117
LDI r1, 50
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 20
LDI r7, 0x000000
PSET r5, r6, r7
HALT
