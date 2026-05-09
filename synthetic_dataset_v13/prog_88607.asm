; DESCRIPTION: Draws a blue circle centered at (410, 163) with radius 50.
; PLAN: r0=410(x), r1=163(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 163
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
