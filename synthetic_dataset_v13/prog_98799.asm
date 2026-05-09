; DESCRIPTION: Draws a magenta circle centered at (445, 95) with radius 60.
; PLAN: r0=445(x), r1=95(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 95
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
