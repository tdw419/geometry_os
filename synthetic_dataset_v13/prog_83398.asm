; DESCRIPTION: Draws a yellow circle centered at (391, 126) with radius 42.
; PLAN: r0=391(x), r1=126(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 126
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
