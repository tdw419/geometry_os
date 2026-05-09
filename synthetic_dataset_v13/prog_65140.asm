; DESCRIPTION: Draws a blue circle centered at (231, 150) with radius 59.
; PLAN: r0=231(x), r1=150(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 150
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
