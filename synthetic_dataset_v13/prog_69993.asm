; DESCRIPTION: Draws a white circle centered at (146, 145) with radius 38.
; PLAN: r0=146(x), r1=145(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 145
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
