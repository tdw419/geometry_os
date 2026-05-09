; DESCRIPTION: Draws a green circle centered at (133, 186) with radius 42.
; PLAN: r0=133(x), r1=186(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 186
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
