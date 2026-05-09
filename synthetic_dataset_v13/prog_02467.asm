; DESCRIPTION: Draws a yellow circle centered at (479, 45) with radius 25.
; PLAN: r0=479(x), r1=45(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 45
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
