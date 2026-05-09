; DESCRIPTION: Draws a blue circle centered at (479, 243) with radius 11.
; PLAN: r0=479(x), r1=243(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 243
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
