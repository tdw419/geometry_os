; DESCRIPTION: Draws a red circle centered at (415, 175) with radius 28.
; PLAN: r0=415(x), r1=175(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 175
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
