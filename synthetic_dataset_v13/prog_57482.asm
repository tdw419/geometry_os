; DESCRIPTION: Draws a white circle centered at (305, 216) with radius 20.
; PLAN: r0=305(x), r1=216(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 216
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
