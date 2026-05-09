; DESCRIPTION: Draws a green circle centered at (410, 171) with radius 60.
; PLAN: r0=410(x), r1=171(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 171
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
