; DESCRIPTION: Draws a green circle centered at (272, 197) with radius 19.
; PLAN: r0=272(x), r1=197(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 197
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
