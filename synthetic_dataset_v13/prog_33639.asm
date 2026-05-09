; DESCRIPTION: Draws a red circle centered at (346, 144) with radius 40.
; PLAN: r0=346(x), r1=144(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 144
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
