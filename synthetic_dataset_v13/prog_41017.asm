; DESCRIPTION: Draws a white circle centered at (479, 211) with radius 28.
; PLAN: r0=479(x), r1=211(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 211
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
