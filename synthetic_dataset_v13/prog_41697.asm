; DESCRIPTION: Draws a black circle centered at (308, 186) with radius 57.
; PLAN: r0=308(x), r1=186(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 186
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
