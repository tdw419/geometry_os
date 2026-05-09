; DESCRIPTION: Draws a green circle centered at (143, 146) with radius 32.
; PLAN: r0=143(x), r1=146(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 146
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
