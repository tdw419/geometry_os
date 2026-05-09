; DESCRIPTION: Draws a white circle centered at (63, 127) with radius 27.
; PLAN: r0=63(x), r1=127(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 127
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
