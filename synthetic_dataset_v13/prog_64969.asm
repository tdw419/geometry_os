; DESCRIPTION: Draws a cyan circle centered at (255, 121) with radius 63.
; PLAN: r0=255(x), r1=121(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 121
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
