; DESCRIPTION: Places a black circle of radius 16 at center (135, 239).
; PLAN: r0=135(x), r1=239(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 239
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
