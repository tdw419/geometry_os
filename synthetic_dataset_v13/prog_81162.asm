; DESCRIPTION: Draws a green circle centered at (456, 42) with radius 25.
; PLAN: r0=456(x), r1=42(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 42
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
