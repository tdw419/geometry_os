; DESCRIPTION: Renders a magenta disk with center (479, 105) and radius 25.
; PLAN: r0=479(x), r1=105(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 105
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
