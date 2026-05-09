; DESCRIPTION: Draws a green circle centered at (202, 126) with radius 72.
; PLAN: r0=202(x), r1=126(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 126
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
