; DESCRIPTION: Draws a yellow circle centered at (272, 197) with radius 52.
; PLAN: r0=272(x), r1=197(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 197
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
