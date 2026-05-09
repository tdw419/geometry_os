; DESCRIPTION: Draws a red circle centered at (442, 209) with radius 21.
; PLAN: r0=442(x), r1=209(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 209
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
