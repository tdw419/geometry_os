; DESCRIPTION: Draws a yellow circle centered at (255, 162) with radius 55.
; PLAN: r0=255(x), r1=162(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 162
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
