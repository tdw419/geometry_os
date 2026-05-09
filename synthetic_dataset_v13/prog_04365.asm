; DESCRIPTION: Draws a red circle centered at (168, 209) with radius 26.
; PLAN: r0=168(x), r1=209(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 209
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
