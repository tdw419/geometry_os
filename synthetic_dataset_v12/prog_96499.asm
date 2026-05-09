; DESCRIPTION: Draws a yellow circle centered at (284, 93) with radius 69.
; PLAN: r0=284(x), r1=93(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 93
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
