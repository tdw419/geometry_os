; DESCRIPTION: Places a yellow circle of radius 21 at center (387, 32).
; PLAN: r0=387(x), r1=32(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 32
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
