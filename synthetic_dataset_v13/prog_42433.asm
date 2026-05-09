; DESCRIPTION: Draws a green circle centered at (383, 104) with radius 68.
; PLAN: r0=383(x), r1=104(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 104
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
