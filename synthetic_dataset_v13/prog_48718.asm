; DESCRIPTION: Draws a red circle centered at (418, 208) with radius 32.
; PLAN: r0=418(x), r1=208(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 208
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
