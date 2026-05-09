; DESCRIPTION: Draws a black circle centered at (470, 150) with radius 34.
; PLAN: r0=470(x), r1=150(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 150
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
