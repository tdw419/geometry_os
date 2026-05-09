; DESCRIPTION: Draws a yellow circle centered at (175, 196) with radius 42.
; PLAN: r0=175(x), r1=196(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 196
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
