; DESCRIPTION: Draws a blue circle centered at (220, 162) with radius 42.
; PLAN: r0=220(x), r1=162(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 162
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
