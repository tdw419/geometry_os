; DESCRIPTION: Draws a green circle centered at (422, 186) with radius 25.
; PLAN: r0=422(x), r1=186(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 186
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
