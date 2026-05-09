; DESCRIPTION: Draws a magenta circle centered at (295, 149) with radius 55.
; PLAN: r0=295(x), r1=149(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 149
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
