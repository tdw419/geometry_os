; DESCRIPTION: Composite: Draws a green circle centered at (66, 116) with radius 63 then Places a red dot at position (48, 228).
; PLAN: r0=66(x), r1=116(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=228(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 66
LDI r1, 116
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 228
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
