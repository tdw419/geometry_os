; DESCRIPTION: Draws a yellow circle centered at (234, 46) with radius 42.
; PLAN: r0=234(x), r1=46(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 46
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
