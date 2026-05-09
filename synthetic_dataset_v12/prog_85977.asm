; DESCRIPTION: Composite: Draws a green circle centered at (99, 144) with radius 59 then Places a red dot at position (9, 246).
; PLAN: r0=99(x), r1=144(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=246(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 144
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 246
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
