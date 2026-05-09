; DESCRIPTION: Draws a yellow circle centered at (295, 56) with radius 31.
; PLAN: r0=295(x), r1=56(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 56
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
