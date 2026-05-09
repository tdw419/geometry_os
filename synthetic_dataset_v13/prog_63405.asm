; DESCRIPTION: Draws a red circle centered at (308, 37) with radius 32.
; PLAN: r0=308(x), r1=37(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 37
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
