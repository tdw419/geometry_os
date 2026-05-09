; DESCRIPTION: Draws a white circle centered at (410, 79) with radius 39.
; PLAN: r0=410(x), r1=79(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 79
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
