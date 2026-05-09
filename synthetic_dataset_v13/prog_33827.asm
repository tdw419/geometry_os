; DESCRIPTION: Draws a magenta circle centered at (398, 144) with radius 77.
; PLAN: r0=398(x), r1=144(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 144
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
