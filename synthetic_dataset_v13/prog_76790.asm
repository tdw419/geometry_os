; DESCRIPTION: Draws a cyan circle centered at (422, 146) with radius 49.
; PLAN: r0=422(x), r1=146(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 146
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
