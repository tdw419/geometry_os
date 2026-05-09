; DESCRIPTION: Draws a red circle centered at (72, 128) with radius 58.
; PLAN: r0=72(x), r1=128(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 128
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
