; DESCRIPTION: Draws a green circle centered at (333, 146) with radius 77.
; PLAN: r0=333(x), r1=146(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 146
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
