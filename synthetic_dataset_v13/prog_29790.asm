; DESCRIPTION: Places a yellow circle of radius 63 at center (111, 171).
; PLAN: r0=111(x), r1=171(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 171
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
