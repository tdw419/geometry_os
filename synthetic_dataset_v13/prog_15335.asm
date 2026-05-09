; DESCRIPTION: Draws a yellow circle centered at (206, 68) with radius 14.
; PLAN: r0=206(x), r1=68(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 68
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
