; DESCRIPTION: Draws a blue circle centered at (298, 127) with radius 57.
; PLAN: r0=298(x), r1=127(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 127
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
