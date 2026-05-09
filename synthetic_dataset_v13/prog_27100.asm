; DESCRIPTION: Draws a green circle centered at (273, 79) with radius 50.
; PLAN: r0=273(x), r1=79(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 79
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
