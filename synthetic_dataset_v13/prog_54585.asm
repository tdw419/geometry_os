; DESCRIPTION: Places a green circle of radius 57 at center (387, 128).
; PLAN: r0=387(x), r1=128(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 128
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
