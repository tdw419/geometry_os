; DESCRIPTION: Draws a white circle centered at (337, 229) with radius 13.
; PLAN: r0=337(x), r1=229(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 229
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
