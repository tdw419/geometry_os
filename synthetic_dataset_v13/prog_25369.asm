; DESCRIPTION: Draws a green circle centered at (410, 200) with radius 12.
; PLAN: r0=410(x), r1=200(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 200
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
