; DESCRIPTION: Draws a white circle centered at (298, 124) with radius 31.
; PLAN: r0=298(x), r1=124(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 124
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
