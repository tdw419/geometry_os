; DESCRIPTION: Places a blue circle of radius 42 at center (360, 199).
; PLAN: r0=360(x), r1=199(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 199
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
