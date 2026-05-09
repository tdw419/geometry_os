; DESCRIPTION: Draws a yellow circle centered at (396, 186) with radius 42.
; PLAN: r0=396(x), r1=186(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 186
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
