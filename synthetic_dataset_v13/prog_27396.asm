; DESCRIPTION: Draws a green circle centered at (298, 212) with radius 42.
; PLAN: r0=298(x), r1=212(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 212
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
