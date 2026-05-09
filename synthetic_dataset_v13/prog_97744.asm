; DESCRIPTION: Draws a white circle centered at (295, 64) with radius 58.
; PLAN: r0=295(x), r1=64(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 64
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
