; DESCRIPTION: Composite: Draws a magenta circle centered at (313, 212) with radius 16 then Places a green dot at position (189, 92).
; PLAN: r0=313(x), r1=212(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x), r6=92(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 212
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 92
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
