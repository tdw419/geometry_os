; DESCRIPTION: Draws a blue circle centered at (410, 97) with radius 40.
; PLAN: r0=410(x), r1=97(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 97
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
