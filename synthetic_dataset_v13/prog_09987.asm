; DESCRIPTION: Places a blue circle of radius 75 at center (434, 82).
; PLAN: r0=434(x), r1=82(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 82
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
