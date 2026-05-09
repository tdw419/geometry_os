; DESCRIPTION: Draws a green circle centered at (271, 93) with radius 65.
; PLAN: r0=271(x), r1=93(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 93
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
