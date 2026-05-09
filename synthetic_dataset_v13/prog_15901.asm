; DESCRIPTION: Composite: Draws a red circle centered at (255, 206) with radius 17 then Places a green dot at position (308, 100).
; PLAN: r0=255(x), r1=206(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=100(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 206
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 100
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
