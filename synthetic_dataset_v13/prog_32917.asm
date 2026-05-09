; DESCRIPTION: Draws a purple circle centered at (284, 117) with radius 57.
; PLAN: r0=284(x), r1=117(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 117
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
