; DESCRIPTION: Places a black circle of radius 27 at center (396, 113).
; PLAN: r0=396(x), r1=113(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 113
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
