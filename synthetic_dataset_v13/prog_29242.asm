; DESCRIPTION: Draws a magenta circle centered at (187, 180) with radius 55.
; PLAN: r0=187(x), r1=180(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 180
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
