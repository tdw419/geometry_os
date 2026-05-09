; DESCRIPTION: Draws a green circle centered at (346, 161) with radius 68.
; PLAN: r0=346(x), r1=161(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 161
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
