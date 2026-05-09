; DESCRIPTION: Draws a purple circle centered at (305, 154) with radius 52.
; PLAN: r0=305(x), r1=154(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 154
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
