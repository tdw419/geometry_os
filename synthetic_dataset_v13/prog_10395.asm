; DESCRIPTION: Draws a red circle centered at (298, 87) with radius 47.
; PLAN: r0=298(x), r1=87(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 87
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
