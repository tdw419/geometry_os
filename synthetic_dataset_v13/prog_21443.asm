; DESCRIPTION: Places a blue circle of radius 63 at center (394, 173).
; PLAN: r0=394(x), r1=173(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 173
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
