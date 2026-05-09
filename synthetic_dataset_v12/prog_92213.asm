; DESCRIPTION: Draws a white circle centered at (470, 160) with radius 27.
; PLAN: r0=470(x), r1=160(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 160
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
